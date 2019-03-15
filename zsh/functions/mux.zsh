_tmuxinator() {
  local commands projects
  commands=(${(f)"$(tmuxinator commands zsh)"})
  projects=(${(f)"$(tmuxinator completions start)"})

  if (( CURRENT == 2 )); then
    _describe -t commands "tmuxinator subcommands" commands
    _describe -t projects "tmuxinator projects" projects
  elif (( CURRENT == 3)); then
    case $words[2] in
      copy|debug|delete|open|start)
        _arguments '*:projects:($projects)'
        ;;
    esac
  fi

  return
}

compdef _tmuxinator tmuxinator mux
alias mux="tmuxinator"

# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=zsh sw=2 ts=2 et
tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

fs() {
  local -r fmt='#{session_id}:|#S|(#{session_attached} attached)'
    { tmux display-message -p -F "$fmt" && tmux list-sessions -F "$fmt"; } \
      | awk '!seen[$1]++' \
      | column -t -s'|' \
      | fzf -q '$' --reverse --prompt 'switch session: ' -1 \
      | cut -d':' -f1 \
      | xargs tmux switch-client -t
}
