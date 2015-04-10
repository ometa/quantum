#!/bin/bash
#
# This script sets up symlinks inside the user's $HOME directory.  It provides overwrite protection.

basename=$(basename $0)

# sanity checking
if [[ ! -f .git/config ]]; then
  echo "Run $basename from the root of the quantum repo"
  exit 1
fi

if [[ $1 == "--force" ]]; then
  force=true
  shift
fi

# what files to skip
skips=(. ..)

# make a breadcrumb trail
repo=$(pwd)

# go to our home directory
pushd $HOME 2>&1 >> /dev/null

# symlink all files
# TODO - forcing directories doesn't work
for i in $(ls -a $repo/home); do

  # skip certain files
  if [[ "$i" == "." || "$i" == ".." ]]; then
    continue
  fi

  # already symlinked
  if [[ -L $i ]]; then
    echo "already symlinked: $i"
  fi

  # condition: force
  if [[ $force ]]; then
    echo "forcing symlink: $i"
    rm $i
    ln -sf $repo/home/$i ./$i
    continue

  # condition: file doesn't exist
  elif [[ ! -e $i ]]; then
      echo "symlinking: $i"
      ln -s $repo/home/$i ./$i

  # condition: file or symlink already exists.  prompt.
  else
      read -p "file (or symlink exists): $i. overwrite? (y/n)"
    if [[ "$REPLY" == "y" ]]; then
          echo "backing up $i to $i.original"
          cp -r $i $i.original
          rsync -av ./$i ./$i.original
          echo "symlinking: $i"
          ln -sf $repo/home/$i ./$i
      fi
  fi

done

popd 2>&1 >> /dev/null

# activate git submodules
git submodule init
git submodule update
