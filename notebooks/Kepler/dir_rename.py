import os
for root, dirs, files in os.walk('/Users/tdutkiewicz/forks/mast_notebooks/notebooks/Kepler'):
    for file in files:
        full_fn = os.path.join(root, file)
        split = file.split('_')
        if split[0] == 'kepler' or split[0] == 'Kepler':
            os.rename(full_fn, os.path.join(root, '_'.join(split[1:])))
