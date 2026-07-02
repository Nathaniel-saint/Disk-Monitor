#!/bin/bash

# My first script to check disk usage and system health

df -h -x none -x tmpfs | tail -n +2 | while read filesystem size used avail usepercent mount;
do
    # removing the percentage from usepercent
    usepercent="${usepercent%\%}"
    echo "Filesystem: $filesystem, Size: $size, Used: $used, Available: $avail, Used%: $usepercent, Mounted: $mount";

    if [[ $usepercent -gt 80 ]]; then
        echo -e "\033[1;31mDisk usage is above 80% on $filesystem\033[0m\n"
    else
        echo -e "\033[0;32mSystem health nominal \033[0m\n"
    fi

done