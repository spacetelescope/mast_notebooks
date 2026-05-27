"""
Script to handle Fornax branch deployment with CI
"""
import glob
from pathlib import Path
import shutil
import yaml

FORNAX_NOTEBOOK_BASEPATH = "mast_notebooks"
FORNAX_MANIFEST = "fornax-manifest.yml"
FORNAX_REQUIREMENTS = "requirements_mast_tutorials.txt"
FORNAX_METADATA_YAML = "notebook_metadata.yml"


def main():
    """
    Do Fornax branch formatting.
    """

    with open(FORNAX_MANIFEST, "r", encoding="utf-8") as f:
        manifest = yaml.safe_load(f)

    # Fornax-preferred renaming:
    Path(FORNAX_NOTEBOOK_BASEPATH).mkdir(parents=True, exist_ok=True)

    # Copy & rename requirements:
    shutil.copy(
        manifest["global-requirements"][0]["requirements-file"],
        f"{FORNAX_NOTEBOOK_BASEPATH}/{FORNAX_REQUIREMENTS}"
    )

    # Copy notebooks over & create reformatted metadata dict:
    nbs_metadata = []
    for nb in manifest["notebooks"]:
        # Copy files:
        orig_path = '/'.join(nb['file'].split('/')[:-1])
        new_path = orig_path.replace("notebooks/", f"{FORNAX_NOTEBOOK_BASEPATH}/")
        shutil.copytree(orig_path, new_path, dirs_exist_ok=True)

        # Reformatted metadata:
        metadict = {}
        for key in ["title", "file", "section", "subsection", "description"]:
            val = nb.get(key, None)
            if val is not None:
                metadict[key] = val

        # Update filename:
        metadict[key] = metadict[key].replace("notebooks/", f"{FORNAX_NOTEBOOK_BASEPATH}/")
        nbs_metadata.append(metadict)

    # Remove the individual file reqiurements.txt files:
    for file in glob.glob(
        f"{FORNAX_NOTEBOOK_BASEPATH}/**/requirements.txt", recursive=True
    ):
        # print(file)
        Path(file).unlink(missing_ok=True)

    # Write out a stripped down yml file with metadata:
    # Title, section, subsection, file
    with open(f"{FORNAX_METADATA_YAML}", 'w', encoding="utf-8") as f:
        yaml.dump(nbs_metadata, f, default_flow_style=False, sort_keys=False)


if __name__ == "__main__":
    main()
