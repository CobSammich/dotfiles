#!/usr/bin/python
"""
This script aims to copy all images/ directories from my vimwiki notes subdirectories to their
corresponding place in the site_html directory
"""

import shutil
from typing import List
import os
import ipdb

### Params
DIR_TO_WALK = "/home/cob/vimwiki"
DIRS_TO_IGNORE = [".git", "site_html"]
DIRS_TO_COPY = ["images"]
###

def intersection(lst1: List[str], lst2: List[str]) -> List[str]:
    """
    Returns the intersection of two lists
    """
    return list(set(lst1) & set(lst2))

def main():
    for root, dirs, files in os.walk(DIR_TO_WALK):
        dirs[:] = [d for d in dirs if d not in DIRS_TO_IGNORE]
        # Don't traverse down site_html and .git

        basename = os.path.basename(root)
        dst = "temp"
        if basename in DIRS_TO_COPY:
            print(root)
            path_dirs = root.split("/")
            vimwiki_pos = path_dirs.index("vimwiki")
            path_dirs.insert(vimwiki_pos + 1, "site_html")
            dst = os.path.join('/', *path_dirs)
            try:
                shutil.copytree(root, dst, dirs_exist_ok=True)
            except Exception as e:
                pass



# traverse root directory, and list directories as dirs and files as files
if __name__ == "__main__":
    main()
