import re
import os

# find all notebooks, minus checkpoint files
r = re.compile(r".*(?<!checkpoint)\.ipynb")

# get list of notebook files using above regex
nbs = []
for a in os.walk("../../notebooks"):
    nb = list(filter(r.match, a[2]))
    if nb:
        nbs.append(nb[0])

# read in the TOC
with open("../../_toc.yml", "r") as infile:
    toc = infile.read()

# find all notebooks and extract only the notebook name
toc_list = re.findall(r"notebooks/.*?/([^/]*?\.ipynb)", toc)

for nb in nbs:
    if nb not in toc_list:
        print(nb)