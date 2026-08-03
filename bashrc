#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ALIAS
alias ls='eza --long --binary --git --git-repos --grid'
alias cd='z'
alias grep='grep --color=auto'

# PROMPT
export PS1="\[\e[38;5;26m\][\u@\h \t] \[\e[38;5;28m\]\w > \[\e[0m\]"

# FZF History Search
if command -v fzf >/dev/null; then
    __fzf_history_search() {
        local result cmd
        result=$(history | fzf --reverse --height=15 --preview="echo {}" --preview-window=down:3)
        [[ -n "$result" ]] && cmd=$(echo "$result" | sed -E 's/^[[:space:]]*[0-9]+[[:space:]]+//')
        [[ -n "$cmd" ]] && {
            READLINE_LINE="$cmd"
            READLINE_POINT=${#cmd}
        }
    }
    bind -x '"\C-r": __fzf_history_search'
fi

# PATHS
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"
export EZA_COLORS="di=38;5;26:ex=38;5;28:fi=0"
export GREP_COLORS="mt=38;5;28:fn=38;5;26:ln=38;5;26:bn=38;5;26:se=38;5;26"

# Tools
eval "$(zoxide init bash)"
