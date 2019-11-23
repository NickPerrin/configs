# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

PATH="$HOME/.cargo/bin:$PATH"
export PATH

alias vim="nvim"
alias vi="nvim"
alias grep="rg"

export RUST_SOURCE_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
