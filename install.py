#!/usr/bin/env python
"""
install.py, a script to backup current config files
and replace with symlinks to files in DOTFILES folder.

Credits:
99.5% of this code is from "make_links.py", Copyright 2010 Stephen A. Goss
"""
import os
import shutil
import stat

DOTFILES_DIR = os.path.dirname(os.path.realpath(__file__))
HOME_DIR = os.path.expanduser("~")

def should_ask(filename):
    """
    conditions for which the user should be prompted for confirmation
    """
    return filename.startswith('.bash') or filename.endswith('profile')

print("DOTFILES in this folder : %s" % DOTFILES_DIR)

DOTFILES = set(os.listdir(DOTFILES_DIR))
DOTFILES = DOTFILES - set(['.git', 'install.py', 'README.md'])
DOTFILES = list(DOTFILES)

print("\n".join(DOTFILES))
print("target home folder : %s" % HOME_DIR)

BACKUP_FOLDER_PATH = os.path.join(HOME_DIR, "backups")

if not os.path.isdir(BACKUP_FOLDER_PATH):
    print("creating backup folder : %s" % BACKUP_FOLDER_PATH)
    os.mkdir(BACKUP_FOLDER_PATH)
for filename in DOTFILES:
    if should_ask(filename):
        answer = raw_input('Symlink %s ? ' % filename)
        if not answer in ['y', 'Y']:
            continue
    print("processing %s ..." % filename)
    target = os.path.join(HOME_DIR, filename)
    dotfile = os.path.join(DOTFILES_DIR, filename)
    try:
        statinfo = os.lstat(target)
    except:
        print("file does not exist : %s" % target)
        statinfo = None
    if statinfo:
        if stat.S_ISLNK(statinfo.st_mode):
            print("skipping symlink : %s" % target)
            continue
        else:
            backup = os.path.join(BACKUP_FOLDER_PATH, filename)
            if stat.S_ISDIR(statinfo.st_mode):
                if not os.path.isdir(backup):
                    print("copying (folder) %s to %s " % (target, backup))
                    shutil.copytree(target, backup)
                print("deleting folder: %s" % target)
                shutil.rmtree(target)
            else:
                if not os.path.isfile(backup):
                    print("copying %s to %s " % (target, backup))
                    shutil.copyfile(target, backup)
                print("delete file : %s" % target)
                os.remove(target)
    print("creating symlink : %s to %s" % (dotfile, target))
    os.symlink(dotfile, target)

print("done!")
