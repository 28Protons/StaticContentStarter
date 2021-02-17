#!/usr/bin/env bash

inotifywait -e modify,close_write,moved_to,create -m /app/content/ |
while read -r directory events filename; do

    if [[ $filename == _* ]]; then
      echo "Partial File Changes, Recompiling All Content"
      all_files=(/app/content/*)
      for f in ${all_files[*]}
        do
          name=$(basename --$f)
          if [[ $name != _* ]]; then
            /app/compile.py ${f} > /app/static/${name}
          fi
      done
    else
      echo "Content File Changed! Recompiling"
      /app/compile.py /app/content/${filename} > /app/static/${filename}
    fi

done
