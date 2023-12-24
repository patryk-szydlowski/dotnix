# !/bin/sh

mime=$(file -Lbs --mime-type "$1")
category=${mime%%/*}
kind=${mime##*/}
ext=${1##*.}

if [ -d "$1" ]; then
  @ezaDir@ -hl --git --color=always --icons "$1"
elif [ "$category" = text ]; then
  @batDir@ --color=always "$1"
else
  exit 1
fi
