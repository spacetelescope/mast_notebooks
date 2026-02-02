# Contributing to mast_notebooks

Contributions are welcome from both inside and outside STScI. This page is for first-time contributors; more advanced instructions can be found 

## Steps to Contribute 
1. Read over the [code of conduct](https://github.com/spacetelescope/mast_notebooks/blob/main/contributing/CODE_OF_CONDUCT.md).
2. Read over the [spacetelescope notebook style guide](https://github.com/spacetelescope/style-guides/blob/master/guides/jupyter-notebooks.md). The style parts are guidelines and it is not always necessary to follow them to the letter, but contributions are expected to generally follow this guide.  However the layout and data rules in general should be followed to ensure this repository stays consistent.
3. Fork this repository. See the preferred method of doing this on the [workflow page](https://github.com/spacetelescope/style-guides/blob/master/guides/git-workflow.md).
4. Create a feature branch to add or modify content (`git checkout -b my-new-feature`).  You should aim to do one branch (and therefore one Pull Request) per notebook, as that will make review faster and easier. 
5. Create your notebook. It can be anywhere within the `notebooks` directory or any level of sub-directory, but each notebook should be in its *own* directory with no other notebooks or other files. See [the Jupyter Notebook template](https://github.com/spacetelescope/mast_notebooks/blob/main/contributing/notebook_template/notebook_template.ipynb) for an idea of how to get started.
6. Develop your notebook by adding and committing it (`git add path/to/my/notebook/notebook.ipynb`,  `git commit -m 'Added some feature'`), as many times as necessary to capture your development history.  Note that you should *never* commit a notebook with executed cells or commit large data files (see the guide).  Always "Clear Ouputs" on cells before adding/committing.
7.  Add a ``requirements.txt`` file next to your notebook.  Each line should be a separate package following `pip` [requirements file conventions](https://pip.pypa.io/en/stable/reference/requirement-specifiers/), listing all the required packages for your notebook, including a "known good version" (e.g., if you wrote the notebook on numpy v1.14.0, the line should be ``numpy>=1.14.0``).
    - **A note on supplemental files:** 
        - Including supplemental files with your notebook is discouraged, and should only occur if the files are not accessible online (e.g. via MAST).
        - See the [style guide](https://github.com/spacetelescope/style-guides/blob/master/guides/where-to-put-your-data.md) for more detailed guidance on how to handle supplemental data.
        - If you do need to add additional files, however, be sure to add that file name to the "Exceptions committed to repo" list within ``notebooks/notebooks/.gitignore``. For example, if you need to add ``diagram.jpg`` to your notebook ``DrizzlePac/sky_matching``, then add ``!DrizzlePac/sky_matching/diagram.jpg`` to the ``.gitignore`` list (don't forget the ``!``). Otherwise, git won't recognize your file. 
8. Push to your github fork's branch (`git push origin my-new-feature`)
9. Create a new Pull Request from your fork into `spacetelescope` using the GitHub web site.  Be sure to include a description that's sufficient for someone *not in your team* to understand the context of the notebook (not all reviewers will be from your team.)

Once you've created a Pull Request, the CI tests will run on your changes.  These ensure that the notebook actually runs, and enforce some of the important elements of "notebook hygine" referenced in the style guide (e.g., not committing notebooks that have been executed).