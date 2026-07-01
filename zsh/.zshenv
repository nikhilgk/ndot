#
# dotzsh : https://github.com/dotphiles/dotzsh
#
# Defines environment variables.
#
# Authors:
#   Ben O'Hara <bohara@gmail.com>
#

# Dont read global configs
unsetopt GLOBAL_RCS

# Set the path to dotzsh.
export DOTZSH="$HOME/.zsh"

# Source environment settings
source "$DOTZSH/env.zsh"

# Customize to your needs...

# Source Rust's cargo env if present (guarded so a missing file doesn't error
# on every shell startup).
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# tmux: use the default socket dir (/tmp/tmux-$UID) consistently across ALL
# shells — interactive, non-interactive, scripts and ssh. Previously
# TMUX_TMPDIR was exported only in .zshrc (interactive-only), so different
# shells landed on different socket dirs and spawned separate tmux servers.
# We unset it here in .zshenv (sourced by every zsh) so nothing can diverge,
# even if a value is inherited via ssh. The /tmp socket is protected from
# systemd-tmpfiles cleanup by /etc/tmpfiles.d/tmux.conf.
unset TMUX_TMPDIR
