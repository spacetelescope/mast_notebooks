# Advanced Tools for Maintainers

This document is intended for people interested in maintaining the repository as a whole. That probably means you are an STScI employee, although maybe some of you out there are just really passionate about notebooks.

Maybe the commands below don't belong in a readme but I can't think of a better way to organize things right now.

## Renaming Every Instance of a Link
We needed to change every link to the STScI logo, which is not trivial to do by hand without risking error. The command below DID solve the problem, although upon reflection the `find` should be modified to match **only** `.ipynb` files; there is binary data that required the prepending of `LC_ALL=C` otherwise. But I'd rather give a flawed command that produces the right end result than one isn't certain to work:
`LC_ALL=C find notebooks -type f -exec sed -i '' 's/https:\/\/raw.githubusercontent.com\/spacetelescope\/notebooks\/master\/assets\/stsci_pri_combo_mark_horizonal_white_bkgd\.png/https:\/\/raw.githubusercontent.com\/spacetelescope\/mast_notebooks\/main\/assets\/stsci-logo.png/g' {} +`
