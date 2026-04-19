#!/bin/sh
echo -ne '\033c\033]0;online\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/online.x86_64" "$@"
