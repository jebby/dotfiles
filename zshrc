# export TERM="screen-256color"
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

setopt EXTENDED_GLOB			
setopt NOMATCH
setopt PROMPT_SUBST				 # Allow command substitution in prompt command

bindkey -e
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit


export EDITOR="vim"
export BROWSER="qutebrowser"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Set a prompt with extra information on the left
PROMPT='$(prompt_info)%B%F{green}%n@%m%f %F{blue}%3~%f $%b '
orig_prompt="$PROMPT"

# Load custom aliases.
if [ -f ~/.zsh_aliases ]; then
	source ~/.zsh_aliases
fi

# Load in directory colors.
if [ -x /usr/bin/dircolors ]; then
	[ -f ~/.dircolors ] && eval $(dircolors -b ~/.dircolors) || eval $(dircolors -b)
fi


# History substring search plugin.
if [ -f ~/.zsh/zsh-history-substring-search.plugin.zsh ]; then
	source ~/.zsh/zsh-history-substring-search.zsh
	HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="fg=white,bold"
	HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="fg=red,bold"
	bindkey "^[[A" history-substring-search-up
	bindkey "^[[B" history-substring-search-down
fi

if [ -f ~/.zsh/gitprompt.sh ]; then
	source ~/.zsh/gitprompt.sh

	# Extra prompt info
	function prompt_info() {
		gitprompt
	}
fi

# [tmux] load scripts in ~/.tmux on creating a new pane
# load order: __before__.sh, ${session_name}.sh, __after__.sh
function tmux_load_startup_scripts_by_session_name() {  
  if [[ -n ${TMUX} ]]; then
    local env_before_script="${HOME}/.tmux/__before__.sh"
    [[ -f "${env_before_script}" ]] && { . "${env_before_script}"; }
    local env_main_script="${HOME}/.tmux/session/$(tmux display-message -p '#{session_name}').sh"
    [[ -f "${env_main_script}" ]] && { . "${env_main_script}"; }
    local env_after_script="${HOME}/.tmux/__after__.sh"
    [[ -f "${env_after_script}" ]] && { . "${env_after_script}"; }
  fi
}
tmux_load_startup_scripts_by_session_name 

# set -o vi
# 
# export KEYTIMEOUT=0.5
# set show-mode-in-prompt on
# 
# function zle-line-init zle-keymap-select {
#     SECTION="${KEYMAP/vicmd/NORMAL}"
#     SECTION="${SECTION/(main|viins)/INSERT}"
#     SECTION="${SECTION/vicmd/COMMAND}"
#     SECTION="${SECTION/isearch/SEARCH}"
#     case $SECTION in
#         "NORMAL")
#             SECTION="$(printf "\033[48;5;114m${SECTION}\033[0m")";;
#         "INSERT");;
#         "COMMAND");;
#         "SEARCH");;
#     esac
#     PROMPT="$SECTION $orig_prompt"
#     zle reset-prompt
# }
# 
# zle -N zle-line-init
# zle -N zle-keymap-select

# <C-x><C-e> to edit current command with $EDITOR
autoload -z edit-command-line 
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# Use vim as manpager
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set nomodifiable ft=man buftype=nofile' -\""

# Load fzf 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
