#
# Executes commands at login pre-zshrc.
#
# Authors:
#   ZOwl <zhhbug@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

#
# Language
#

export LC_ALL='en_US.UTF-8'
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#
export GOPATH=$HOME/.go
export STAGING_DIR=~/Applications/OpenWrt-SDK-ar71xx-generic_gcc-5.3.0_musl-1.1.14.Darwin-x86_64/staging_dir
export ANDROID_SDK_ROOT=/usr/local/share/android-sdk
export NDK_HOME=~/Applications/android-ndk-r16b

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  # ~/android-sdk-linux/build-tools
  # ~/android-sdk-linux/platform-tools
  # ~/android-sdk-linux/tools
  $NDK_HOME
  ~/.rbenv/shims
  ~/.go/bin
  ~/.composer/vendor/bin
  ~/bin/Sencha/Cmd
  $STAGING_DIR/toolchain-mips_34kc_gcc-5.3.0_musl-1.1.14/bin
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
if (( $+commands[lesspipe.sh] )); then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$USER"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
  mkdir -p "$TMPPREFIX"
fi

#
# Misc
#

export RUST_SRC_PATH=/usr/local/src/rustc-1.1.0/src
eval "$(rbenv init -)"

source ~/.cargo/env

eval "$(pyenv init -)"

export CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH=/usr/local/cuda/lib:/usr/local/cuda/extras/CUPTI/lib
export LD_LIBRARY_PATH=$DYLD_LIBRARY_PATH
export PATH=$DYLD_LIBRARY_PATH:$PATH

export NVM_DIR="/Users/zhonghao/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
