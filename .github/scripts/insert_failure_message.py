# .github/scripts/insert_failure_message.py
# This script inserts a message into the generated HTML to let users know that the notebook currently fails execution
import nbformat as nbf
import sys

notebook_filename = sys.argv[1]

with open(notebook_filename, "r") as f:
    nb = nbf.read(f, as_version=4)

new_cell = nbf.v4.new_markdown_cell('<font color="red">Automated testing has found an error in this Notebook. The authors have been notified and are working on the issue; in the meantime, please use this as a reference only.</font>')
# Insert the cell at the second position in the notebook
nb.cells.insert(1, new_cell)

with open(notebook_filename, "w") as f:
    nbf.write(nb, f)
