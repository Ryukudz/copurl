#!/bin/bash

wordlist="$1"
line="$2"
output="${wordlist%.*}-numbered.${wordlist##*.}"

# Check if the wordlist exists
if [ ! -f "$wordlist" ]; then
  echo "File $wordlist does not exist."
  exit 1
fi

# Check if the wordlist is numbered
if grep -qE '^[0-9]+\. ' "$wordlist"; then
  # Lines are numbered, simply copy the provided line
  if [ -n "$line" ]; then
    url=$(grep -E '^[0-9]+\. ' "$wordlist" | sed -n "${line}s/^[0-9]\+\. //p")
    echo -n "$url" | xclip -selection clipboard
    echo "URL copied to clipboard: $url"
  fi
else
  # Lines are not numbered, create a new numbered file
  awk '{print NR ". " $0}' "$wordlist" > "$output"
  echo "Numbered file created: $output"
  if [ -n "$line" ]; then
    url=$(awk -F'. ' -v idx="$line" 'NR==idx { $1=""; print $0 }' "$output" | sed 's/^[[:blank:]]*//')
    echo -n "$url" | xclip -selection clipboard
    echo "URL copied to clipboard: $url"
  fi
fi
