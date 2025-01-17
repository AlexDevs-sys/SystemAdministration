#!/bin/bash
if [ $# -ne 2 ]
        then
        echo 'Wrong params number, first backup dir location, second file to be archived path'
        exit 1
fi

dest_dir_path=$1
source_path=$2
export CURRENT_DATE=$(date '+%Y-%m-%d')

mkdir -p "$dest_dir_path/fresh.bak.d" "$dest_dir_path/eachday.bak.d/$CURRENT_DATE"

if [ $? -ne 0 ]
        then
        echo "Unable to create directories in $dest_dir_path error: $?"
        exit 2
fi

tar -czvf "$dest_dir_path/fresh.bak.d/my-wiki.tar.gz" "$source_path"

if [ $? -ne 0 ]
        then
        echo "tar error: $?"
        exit 3
fi

cp "$dest_dir_path/fresh.bak.d/my-wiki.tar.gz" "$dest_dir_path/eachday.bak.d/$CURRENT_DATE"

if [ $? -ne 0 ]
        then
        echo "cp error while copying to $dest_dir_path/eachday.bak.d/$CURRENT_DATE: $?"
        exit 4
fi

echo 'Media (media-wiki) Backup is sent'
exit 0
