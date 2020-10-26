#!/usr/bin/env bash

# Dont link DS_Store files
find . -name ".DS_Store" -exec rm {} \;

PROGRAMS=(git stow vim bash config ssh)


for program in ${PROGRAMS[@]}; do
  stow -v $program
  echo "Setting up $program"
done

echo "Done"
