#!/usr/bin/env bash

# This script opens the current git repository in the default web browser. It works
# by extracting the remote URL of the repository and converting it to a web URL.
# It supports both SSH and HTTPS remote URLs.

cd "$(tmux display-message -p -F "#{pane_current_path}")" || exit 1

url=$(git remote get-url origin) 

url="${url##*:}"
url="${url#*github.com/}"

url="${url%.git}"

url="https://github.com/$url"

open "$url"
