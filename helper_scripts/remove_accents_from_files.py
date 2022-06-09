#!/usr/bin/env python3
import argparse
import os
from unidecode import unidecode

parser = argparse.ArgumentParser(description='Normalize file and dirnames, including links in md files')
parser.add_argument('root_dir')
args = parser.parse_args()

dirs_to_rename = {}
files_to_rename = {}

def _store_rename(name, target):
    if name in dirs_to_rename:
        return
    normalized = unidecode(name)
    if normalized != name:
        target[name] = normalized

# get what to rename
for root, dirs, files in os.walk(args.root_dir):
    for directory in dirs:
        _store_rename(directory, dirs_to_rename)
    for filename in files:
        _store_rename(filename, files_to_rename)

# rename dirs
for root, dirs, files in os.walk(args.root_dir, topdown=False):
    for directory in dirs:
        if directory in dirs_to_rename:
            os.rename(os.path.join(root, directory), os.path.join(root, dirs_to_rename[directory]))


# rename files
for root, dirs, files in os.walk(args.root_dir):            
    for filename in files:
        if filename in files_to_rename:
            os.rename(os.path.join(root, filename), os.path.join(root, files_to_rename[filename]))
        

# rewrite links
for root, dirs, files in os.walk(args.root_dir):            
    for filename in files:
        if filename.endswith('.md'):
            with open(os.path.join(root, filename), 'r') as inf:
                contents = inf.read()
            for dirname in dirs_to_rename:
                contents = contents.replace(f'/{dirname}/', f'/{dirs_to_rename[dirname]}/')
            for to_rename in files_to_rename:
                contents = contents.replace(to_rename, files_to_rename[to_rename])
            with open(os.path.join(root, filename), 'w') as outf:
                outf.write(contents)
