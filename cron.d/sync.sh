#!/bin/bash

set -e
target_dir="/home/syamaguc/vimwiki"

set -x
cd "$target_dir"
git add -A
git commit -m "Auto commit at $(date "+%Y-%m-%d %T")" || true
git push -f origin main:main
