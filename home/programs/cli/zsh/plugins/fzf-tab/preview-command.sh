#!/bin/sh

preview_command_with_tldr() {
  preview=$(MANWIDTH=$FZF_PREVIEW_COLUMNS tldr "$1") 2>/dev/null && echo "$preview"
}

preview_command_with_batman() {
  preview=$(MANWIDTH=$FZF_PREVIEW_COLUMNS batman --color=always "$1" 2>/dev/null) && echo "$preview"
}

preview_command_with_which() {
  preview=$(which "$1" 2>/dev/null) && echo "$preview"
}

preview_command() {
  if preview_command_with_tldr "$1"; then
    return
  fi

  if preview_command_with_batman "$1"; then
    return
  fi

  if preview_command_with_which "$1"; then
    return
  fi

  echo "Preview not available"
}

preview_command "$1"
