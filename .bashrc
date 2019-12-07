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

GOPATH="$HOME/dev/go"
export GOPATH

# PATH
# go
PATH="$HOME/.cargo/bin:$GOPATH/bin:/usr/local/go/bin:$HOME/scripts:$PATH"

# rust 
PATH="$HOME/.cargo/bin:$PATH"
export PATH

# alias
alias vim="nvim"
alias vi="nvim"
alias lsl="ls -l"
alias grep="rg"

export RUST_SOURCE_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
