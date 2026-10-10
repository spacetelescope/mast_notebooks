"""
scheduled_ci_report.py

Compares the latest "Notebook CI - Scheduled" GitHub Actions workflow run with
the run closest to 7 days prior, then writes a Markdown diff-report to stdout
(or to the file given as the first CLI argument).

Usage:
    python scheduled_ci_report.py [output_file.md]

Required environment variables:
    GITHUB_TOKEN  – a token with repo read access
    GITHUB_REPOSITORY – owner/repo, e.g. "spacetelescope/mast_notebooks"
"""

import os
import sys
from datetime import datetime, timedelta, timezone

import requests

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------
REPO = os.environ.get("GITHUB_REPOSITORY", "spacetelescope/mast_notebooks")
TOKEN = os.environ.get("GITHUB_TOKEN", "")
WORKFLOW_NAME = "Notebook CI - Scheduled"
COMPARE_DAYS = 7
API_BASE = "https://api.github.com"

HEADERS = {
    "Accept": "application/vnd.github+json",
    "X-GitHub-Api-Version": "2022-11-28",
}
if TOKEN:
    HEADERS["Authorization"] = f"Bearer {TOKEN}"


# ---------------------------------------------------------------------------
# GitHub API helpers
# ---------------------------------------------------------------------------

def gh_get(url, params=None):
    resp = requests.get(url, headers=HEADERS, params=params, timeout=30)
    resp.raise_for_status()
    return resp.json()


def get_workflow_id(repo, workflow_name):
    """Return the numeric workflow ID for a given workflow name."""
    url = f"{API_BASE}/repos/{repo}/actions/workflows"
    data = gh_get(url, params={"per_page": 100})
    for wf in data.get("workflows", []):
        if wf["name"] == workflow_name:
            return wf["id"]
    raise ValueError(f"Workflow '{workflow_name}' not found in {repo}")


def list_workflow_runs(repo, workflow_id, per_page=50):
    """Return completed workflow runs, most-recent first."""
    url = f"{API_BASE}/repos/{repo}/actions/workflows/{workflow_id}/runs"
    data = gh_get(url, params={"status": "completed", "per_page": per_page})
    return data.get("workflow_runs", [])


def get_notebook_results(repo, run_id):
    """Return {notebook_path: conclusion} for a given run.

    Only jobs whose names contain 'process-notebooks' are considered;
    the notebook path is extracted from the parenthesised portion of the
    job name, e.g.
        "execute-all / process-notebooks (notebooks/foo/bar.ipynb)"
    """
    results = {}
    url = f"{API_BASE}/repos/{repo}/actions/runs/{run_id}/jobs"
    params = {"per_page": 100, "filter": "all"}
    while url:
        resp = requests.get(url, headers=HEADERS, params=params, timeout=30)
        resp.raise_for_status()
        data = resp.json()
        for job in data.get("jobs", []):
            name = job.get("name", "")
            if "process-notebooks" not in name:
                continue
            # Extract "notebooks/…" from the parenthesised section
            if "(" in name and name.endswith(")"):
                nb_path = name[name.index("(") + 1: -1].strip()
            else:
                nb_path = name
            results[nb_path] = job.get("conclusion", "unknown")
        # Follow pagination
        link = resp.headers.get("Link", "")
        url = None
        params = {}
        for part in link.split(","):
            part = part.strip()
            if 'rel="next"' in part:
                url = part.split(";")[0].strip().strip("<>")
    return results


# ---------------------------------------------------------------------------
# Report generation
# ---------------------------------------------------------------------------

def find_comparison_run(runs, latest_run):
    """Return the run whose start time is closest to 7 days before latest_run."""
    latest_dt = datetime.fromisoformat(
        latest_run["created_at"].replace("Z", "+00:00")
    )
    target_dt = latest_dt - timedelta(days=COMPARE_DAYS)
    best = None
    best_delta = timedelta.max
    for run in runs:
        if run["id"] == latest_run["id"]:
            continue
        run_dt = datetime.fromisoformat(run["created_at"].replace("Z", "+00:00"))
        delta = abs(run_dt - target_dt)
        if delta < best_delta:
            best_delta = delta
            best = run
    return best


def build_report(latest_run, comparison_run, latest_results, comparison_results):
    """Return a Markdown-formatted comparison report string."""
    now = datetime.now(timezone.utc).strftime("%Y-%m-%d %H:%M UTC")

    latest_url = latest_run["html_url"]
    latest_date = latest_run["created_at"][:10]
    comparison_url = comparison_run["html_url"]
    comparison_date = comparison_run["created_at"][:10]

    all_notebooks = sorted(
        set(latest_results.keys()) | set(comparison_results.keys())
    )

    new_failures = []       # passing before → failing now
    resolved_failures = []  # failing before → passing now
    consistent_failures = []
    consistent_successes = []
    only_in_latest = []
    only_in_comparison = []

    for nb in all_notebooks:
        in_latest = nb in latest_results
        in_comparison = nb in comparison_results
        if in_latest and not in_comparison:
            only_in_latest.append((nb, latest_results[nb]))
            continue
        if in_comparison and not in_latest:
            only_in_comparison.append((nb, comparison_results[nb]))
            continue

        prev = comparison_results[nb]
        curr = latest_results[nb]

        if prev == "success" and curr == "failure":
            new_failures.append(nb)
        elif prev == "failure" and curr == "success":
            resolved_failures.append(nb)
        elif prev == "failure" and curr == "failure":
            consistent_failures.append(nb)
        elif prev == "success" and curr == "success":
            consistent_successes.append(nb)

    total_latest = len(latest_results)
    fail_latest = sum(1 for c in latest_results.values() if c == "failure")
    pass_latest = sum(1 for c in latest_results.values() if c == "success")

    total_comparison = len(comparison_results)
    fail_comparison = sum(1 for c in comparison_results.values() if c == "failure")
    pass_comparison = sum(1 for c in comparison_results.values() if c == "success")

    lines = [
        f"# Notebook CI – Scheduled Run Comparison",
        f"",
        f"_Generated {now}_",
        f"",
        f"| | Run | Date | Pass | Fail | Total |",
        f"|---|---|---|---|---|---|",
        f"| **Latest** | [#{latest_run['run_number']}]({latest_url}) | {latest_date} | {pass_latest} | {fail_latest} | {total_latest} |",
        f"| **~7 days ago** | [#{comparison_run['run_number']}]({comparison_url}) | {comparison_date} | {pass_comparison} | {fail_comparison} | {total_comparison} |",
        f"",
    ]

    # New failures
    lines.append(f"## 🔴 New Failures ({len(new_failures)})")
    lines.append("")
    if new_failures:
        lines.append("These notebooks **passed** in the earlier run but **failed** in the latest run:")
        lines.append("")
        for nb in new_failures:
            lines.append(f"- `{nb}`")
    else:
        lines.append("_No new failures_ ✅")
    lines.append("")

    # Resolved failures
    lines.append(f"## 🟢 Resolved Failures ({len(resolved_failures)})")
    lines.append("")
    if resolved_failures:
        lines.append("These notebooks **failed** in the earlier run but **passed** in the latest run:")
        lines.append("")
        for nb in resolved_failures:
            lines.append(f"- `{nb}`")
    else:
        lines.append("_No resolved failures_")
    lines.append("")

    # Consistent failures
    lines.append(f"## 🟡 Consistent Failures ({len(consistent_failures)})")
    lines.append("")
    if consistent_failures:
        lines.append("These notebooks **failed in both** runs:")
        lines.append("")
        for nb in consistent_failures:
            lines.append(f"- `{nb}`")
    else:
        lines.append("_No consistent failures_ ✅")
    lines.append("")

    # Consistent successes (collapsible)
    lines.append(f"## ✅ Consistent Successes ({len(consistent_successes)})")
    lines.append("")
    lines.append("<details>")
    lines.append("<summary>Click to expand</summary>")
    lines.append("")
    if consistent_successes:
        for nb in consistent_successes:
            lines.append(f"- `{nb}`")
    else:
        lines.append("_None_")
    lines.append("")
    lines.append("</details>")
    lines.append("")

    # Notebooks only in one run (usually means they were added/removed)
    if only_in_latest:
        lines.append(f"## ➕ Only in Latest Run ({len(only_in_latest)})")
        lines.append("")
        for nb, conclusion in only_in_latest:
            lines.append(f"- `{nb}` ({conclusion})")
        lines.append("")

    if only_in_comparison:
        lines.append(f"## ➖ Only in Earlier Run ({len(only_in_comparison)})")
        lines.append("")
        for nb, conclusion in only_in_comparison:
            lines.append(f"- `{nb}` ({conclusion})")
        lines.append("")

    return "\n".join(lines)


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def main():
    output_file = sys.argv[1] if len(sys.argv) > 1 else None

    print(f"Fetching workflow runs for '{WORKFLOW_NAME}' in {REPO}…", file=sys.stderr)
    workflow_id = get_workflow_id(REPO, WORKFLOW_NAME)
    runs = list_workflow_runs(REPO, workflow_id)

    if not runs:
        print("No completed runs found.", file=sys.stderr)
        sys.exit(1)

    latest_run = runs[0]
    comparison_run = find_comparison_run(runs, latest_run)

    if comparison_run is None:
        print("Could not find a comparison run ~7 days ago.", file=sys.stderr)
        sys.exit(1)

    print(
        f"Latest run:     #{latest_run['run_number']} ({latest_run['created_at'][:10]})",
        file=sys.stderr,
    )
    print(
        f"Comparison run: #{comparison_run['run_number']} ({comparison_run['created_at'][:10]})",
        file=sys.stderr,
    )

    print("Fetching job results for latest run…", file=sys.stderr)
    latest_results = get_notebook_results(REPO, latest_run["id"])
    print("Fetching job results for comparison run…", file=sys.stderr)
    comparison_results = get_notebook_results(REPO, comparison_run["id"])

    report = build_report(latest_run, comparison_run, latest_results, comparison_results)

    if output_file:
        with open(output_file, "w") as f:
            f.write(report)
        print(f"Report written to {output_file}", file=sys.stderr)
    else:
        print(report)


if __name__ == "__main__":
    main()
