# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.


# plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS


# Lines configured by zsh-newuser-install
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -e

# Editor
export EDITOR="code"

ZSH_THEME="dracula"

source /home/prithvi/.config/zsh-syntax-highlighting.sh

# keys
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey '^H' backward-kill-word
bindkey '5~' kill-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/prithvi/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# p10k
#source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
#oh-my-posh

eval "$(oh-my-posh init zsh --config /home/prithvi/.config/uew.omp.json)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ls colors
alias ls="ls --color=auto"

# lazy apps
alias n='code'
alias gg='lazygit'

# go to code directory
go_to_code () {
  cd /home/prithvi/Documents/Projects || echo "/Code doesn't exist." || exit
  PS3="Select project: "
  projects=($(ls -d */))
  select prj in "${projects[@]}"; do
  	cd "$prj" || echo "aser"
  	break
  done
  PS3="Open Editor: "
  optns=("Yes", "No")
  select opt in "${optns[@]}"; do
    case "$opt" in
      "Yes") code .
      ;;
      "No") break
      ;;
      *) code .
      ;;
    esac
  	break
  done
}
alias c='go_to_code'

# go to config
go_to_config() {
  cd ~/.config/$1
  code .
}
alias conf='go_to_config'
alias mkgit='/home/prithvi/.local/bin/github.sh'





#neofetch


#cpufetch




