#!/usr/bin/env bash

# Dont link DS_Store files
find . -name ".DS_Store" -exec rm {} \;

PROGRAMS=(git gdb stow vim bash config ssh)

BACKUPS=(.bash_profile .bashrc .bash_logout .zshrc .ssh .tmux.conf)

function backup_if_exists() {
    if [ -f $1 ];
    then
      mv $1 "$1.bk"
    fi
    if [ -d $1 ];
    then
      mv $1 "$1.bk"
    fi
}

for backup in ${BACKUPS[@]}; do
  backup_if_exists ~/$backup
  echo "Backup $backup"
done

for program in ${PROGRAMS[@]}; do
  stow -v $program
  echo "Setting up $program"
done

echo "Done"
