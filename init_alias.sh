#!/bin/zsh

# Programme, die als Alias geladen werden sollen
# Beispiel: git, docker, python, vim
alias_commands=(
  "alias gst='git status'"
  "alias dcu='docker compose up'"
  "alias py='python3'"
  "alias v='vim'"
)

alias_file="$HOME/.zsh_aliases"

# Schreibe/ergänze Aliase in die ~/.zsh_aliases
for cmd in $alias_commands; do
  if ! grep -q "${cmd}" "${alias_file}" 2>/dev/null; then
    echo "${cmd}" >> "${alias_file}"
  fi
done

# Prüfe, ob die Source-Zeile bereits in ~/.zshrc existiert
source_line="if [ -f ~/.zsh_aliases ]; then\n    source ~/.zsh_aliases\nfi"
if ! grep -q "source ~/.zsh_aliases" "$HOME/.zshrc"; then
  echo "" >> "$HOME/.zshrc"
  printf "$source_line\n" >> "$HOME/.zshrc"
fi
