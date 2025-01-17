#!/bin/bash
if [ $# -ne 1 ]
        then
        echo 'Wrong params number, first and only param for backup destination dir path'
        exit 1
fi

dest_dir_path=$1
export CURRENT_DATE=$(date '+%Y-%m-%d')
export CURRENT_TIME=$(date '+%H:%M')

mkdir -p "$dest_dir_path/fresh.bak.d" "$dest_dir_path/eachday.bak.d/$CURRENT_DATE/$CURRENT_TIME"

if [ $? -ne 0 ]
        then
        echo "Unable to create directories in $dest_dir_path error: $?"
        exit 2
fi

sudo -u postgres -i pg_dumpall > "$dest_dir_path/eachday.bak.d/$CURRENT_DATE/$CURRENT_TIME/all.sql"

if [ $? -ne 0 ]
        then
        echo "tar error: $?"
        exit 3
fi

cp "$dest_dir_path/eachday.bak.d/$CURRENT_DATE/$CURRENT_TIME/all.sql" "$dest_dir_path/fresh.bak.d/all.sql"

if [ $? -ne 0 ]
        then
        echo "cp error while copying to $dest_dir_path/fresh.bak.d/: $?"
        exit 4
fi

echo 'SQl Backup is sent'
exit 0
