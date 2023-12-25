# !/bin/sh

keyword="$1"
keyword_mime=$(file -Lbs --mime-type "$keyword")
keyword_category=${mime%%/*}

if [ -d "$keyword" ]; then
  @ezaPath@ -hl --git --color=always --icons "$keyword"
elif [ "$category" = text ]; then
  @batPath@ --color=always "$keyword"
else
  exit 1
fi
