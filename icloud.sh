#!/bin/bash
#
# icloud -- a lite icloud utility
#
# copyright (c) 2018 Cj-bc
#
# This software is released under MIT License.
# https://opensource.org/license/mit-license.php

version=0.0.1
icloudpath="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
temppath="$icloudpath/clitemp"

[ -e "$temppath" ] || mkdir "$temppath"

# get verb. if no arg, set to version
[ "$#" -ne "0" ] && verb="$1" || verb="version"

case $verb in
  "ls" ) ls "$icloudpath/$2";;
  "upload" | "-u" ) cp "$2" "$temppath";;
  "download" | "-d" ) cp "$icloudpath/$2" "./$2";;
  "version" | "-v" ) echo "icloud utility: ver."$version;;
  "help" | "-h" ) cat <<-EOT
                    lite icloud utility: ver.$version
                    usage: icloud <verb> <object>
                    which verb is below
                      ls <path> -- list
                      upload,-u <file> -- upload file into clitemp directory under icloud
                      download,-d <file> -- downcload specified file into current directory
                      version,-v -- show version
                      help,-h -- show this help
EOT
                    ;;
  * ) echo "unknown verb";exit 1;;
esac

exit 0
