import re

with open('_toc.yml', 'r') as infile:
    data = infile.read()

data = re.sub('/Kepler/[K,k]epler_(.*?)/[K,k]epler_(.*?\.ipynb)', r'/Kepler/\1/\2', data)

with open('_newtoc.yml', 'w') as outfile:
    outfile.write(data)
