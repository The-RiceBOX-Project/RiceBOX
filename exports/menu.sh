#!/bin/sh
echo -ne '\033c\033]0;RiceBOXMenu2.0\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/menu.arm64" "$@"
