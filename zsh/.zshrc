#
# dotzsh : https://github.com/dotphiles/dotzsh
#
# Sets dotzsh options.
#
# Authors:
#   Ben O'Hara <bohara@gmail.com>
#

# debug: see with `dzinfo`
##zstyle ':dotzsh:load' timing 'yes'
##zstyle ':dotzsh:module:*' timing 'yes'

# Set the Zsh modules to load (man zshmodules).
zstyle ':dotzsh:load' zmodule 'stat'

# Set the Zsh functions to load (man zshcontrib).
zstyle ':dotzsh:load' zfunction 'zargs' 'zmv'

# Set the dotzsh modules to load (browse modules).
# The order matters.
zstyle ':dotzsh:load' dzmodule \
  'gnu-utility' \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'utility' \
  'completion' \
  'git' \
  'python' \
  'directory' \
  'theme'

### Global settings
# Color output (auto set to 'no' on dumb terminals).
zstyle ':dotzsh:module:*' color 'yes'
# Setup aliases for modules (disable per module below).
zstyle ':dotzsh:module:*' aliases 'yes'
# Set case-sensitivity for completion, history lookup, etc.
zstyle ':dotzsh:module:*' case-sensitive 'no'

### Environment module
# Set which PAGER to use less or more
##zstyle ':dotzsh:module:environment' pager 'less'
# Enable mouse scrolling in less, add the following to *zshrc*
##zstyle ':dotzsh:module:environment:pager:less' mousescroll 'false'

### Terminal Module
# Auto set the tab and window titles.
zstyle ':dotzsh:module:terminal' auto-title 'yes'

### Editor module
# Set the key mapping style to 'emacs' or 'vi'.
zstyle ':dotzsh:module:editor' keymap 'emacs'
# Set EDITOR to 'emacs' or 'vi'.
zstyle ':dotzsh:module:editor' editor 'nano'
# Auto convert .... to ../..
#zstyle ':dotzsh:module:editor' dot-expansion 'yes'

### Utility Module
# Disable `diff` highlighting
##zstyle ':dotzsh:module:utility:diff' color 'no'
# Disable `wdiff` highlighting
##zstyle ':dotzsh:module:utility:wdiff' color 'no'
# Disable `make` highlighting
##zstyle ':dotzsh:module:utility:make' color 'no'

### Completion module
# Expand global aliases automatically
#zstyle ':dotzsh:module:completion' expand-global-aliases 'yes'

### SSH module
zstyle ':dotzsh:module:ssh:agent' forwarding 'yes'
#zstyle ':dotzsh:module:ssh:aliases' hosts 'yes'
##zstyle ':dotzsh:module:ssh:agent' identities 'id_rsa' 'id_rsa2' 'id_github'

### GNUPG module
# Enable ssh-agent protocol emulation for gpg-agent
##zstyle ':dotzsh:module:gnupg' agent-ssh-support 'yes'

### OSX module
# Add aliases for Applications
##zstyle ':dotzsh:module:osx' launcher 'yes'
# Open/Resume temrinal in correct dir
##zstyle ':dotzsh:module:osx' terminal-resume 'yes'

### Git module
# Disable all git aliases
##zstyle ':dotzsh:module:git' aliases 'no'

### TMUX module
# Auto start a session when Zsh is launched.
# Setting it to 'local' only starts a session for local terminals.
# Setting it to 'remote' only starts a session for SSH connections.
##zstyle ':dotzsh:module:tmux' auto-start 'no'
#zstyle ':dotzsh:module:tmux:aliases' tmuxinator 'yes'

### Syntax Highlighting module
#zstyle ':dotzsh:module:syntax-highlighting' highlighters 'main' 'brackets' 'pattern' \
#  'cursor' 'root' \

### Theme module
# Set default theme to load.
# Setting it to 'random' loads a random theme.
# Auto set to 'off' on dumb terminals.
zstyle ':dotzsh:module:theme' theme 'steeef' 'soldark' 'orange'
### Set custom theme based on hostname or domain
# zstyle ':dotzsh:module:theme:hostname:your-host-here' theme 'dotphiles' 'soldark' 'magenta'
# zstyle ':dotzsh:module:theme:hostname:your-other-host-here' theme 'dotphiles' 'soldark' 'violet'
# zstyle ':dotzsh:module:theme:domain:your-domain-here' theme 'dotphiles' 'soldark' 'orange'

### Load dotzsh
source "$DOTZSH/init.zsh"

### Customize to your needs...

#less code highlight
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R '

########Nikhil's aliases
alias less='less -+X' 
alias nps='ps -aef | grep'
alias nkill='killall -9'
alias sshpw='ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no '
alias gitlog='noglob git log --abbrev-commit   --branches=* --graph --decorate --pretty=format:"%Cgreen%h %Creset%ar %Cgreen%aD  %Cred%an %C(red)%d %Creset%s"'
#noglob to prevent zsh from interpretting the * as wildcard for the shell

# The next line updates PATH for the Google Cloud SDK.
source '/home/nikhil/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/home/nikhil/google-cloud-sdk/completion.zsh.inc'

# Support for command not found
source '/etc/zsh_command_not_found'

