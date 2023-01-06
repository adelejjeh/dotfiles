# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes
#
#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#	# We have color support; assume it's compliant with Ecma-48
#	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
#	# a case would tend to support setf rather than setaf.)
#	color_prompt=yes
#    else
#	color_prompt=
#    fi
#fi
color_prompt=yes

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
  *)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  export LS_COLORS=$LS_COLORS:'di=01;36'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Source global definitions
if [ -f /etc/bash.bashrc ]; then
  . /etc/bash.bashrc
fi

# User specific aliases and functions

if [ -e /usr/bin/vimx ]; then alias vim='/usr/bin/vimx'; fi

#module load cmake
#module load python

export PATH=$HOME/bin:/snap/bin:$PATH
export WORKDIR=$HOME/work_dir
export SCRATCH_WORKSPACE=/scratch/workspace/aejjeh
export HPVM_FPGA_ROOT=$SCRATCH_WORKSPACE/hpvm/hpvm
export LLVM_SRC_ROOT=$HPVM_FPGA_ROOT/llvm 
export LLVM_39_ROOT=$WORKDIR/llvm_39
export LLVM_4_ROOT=$WORKDIR/llvm_4
export LLVM_34_ROOT=$WORKDIR/llvm_34
export PYTHON_EXECUTABLE=/software/python-3.4.3/bin/python3
if [ "$HOSTNAME" = "tyler" ]; then
  echo "On tyler.cs.illinois.edu"
  export QUARTUSDIR=/opt/intelFPGA_pro/18.0/quartus
  export QUARTUSBIN=$QUARTUSDIR/bin 
  alias quartus=$QUARTUSBIN/quartus
  #module load cadence/Sep2017
  export LM_LICENSE_FILE=$LM_LICENSE_FILE:/srv/license/1-GIA2IH_License.dat:1713@altera.webstore.illinois.edu
  export PATH=$LLVM_SRC_ROOT/build/bin:$LLVM_4_ROOT/build/bin:$LLVM_39_ROOT/build/bin:$PATH
  #  export CC=$LLVM_4_ROOT/build/bin/clang
  #  export CXX=$LLVM_4_ROOT/build/bin/clang++
fi
if [ "$HOSTNAME" = "burman.cs.illinois.edu" ]; then
  echo "On burman.cs.illinois.edu"
  module load gcc/5.3
  export HPVM_FPGA_ROOT=$WORKDIR/hpvm_burman 
  export LLVM_SRC_ROOT=$HPVM_FPGA_ROOT/llvm 
  export PATH=$LLVM_4_ROOT/build_burman/bin:$LLVM_39_ROOT/build_burman/bin:$LLVM_SRC_ROOT/build_burman/bin:$PATH
  export CC=$LLVM_4_ROOT/build_burman/bin/clang
  export CXX=$LLVM_4_ROOT/build_burman/bin/clang++
fi
if [ "$HOSTNAME" = "hpvmfpga" ]; then
  echo "On hpvmfpga.cs.illinois.edu"
  export QUARTUSDIR=/opt/intelFPGA_pro/19.1/quartus
  export QUARTUS_ROOTDIR=/opt/intelFPGA_pro/19.1/quartus
  export QUARTUSBIN=$QUARTUSDIR/bin 
  alias quartus=$QUARTUSBIN/quartus
  export LM_LICENSE_FILE=$LM_LICENSE_FILE:/srv/license/1-GIA2IH_License.dat:1713@altera.webstore.illinois.edu
  export PATH=$LLVM_SRC_ROOT/build/bin:$LLVM_4_ROOT/build/bin:$LLVM_39_ROOT/build/bin:$PATH
  export CC=$LLVM_4_ROOT/build/bin/clang
  export CXX=$LLVM_4_ROOT/build/bin/clang++
  export XILINX_VIVADO=/srv/Xilinx/Vivado/2017.2
fi
#      export PATH=/srv/Xilinx/SDK/2017.2/bin:/srv/Xilinx/SDK/2017.2/gnu/microblaze/lin/bin:/srv/Xilinx/SDK/2017.2/gnu/arm/lin/bin:/srv/Xilinx/SDK/2017.2/gnu/microblaze/linux_toolchain/lin64_be/bin:/srv/Xilinx/SDK/2017.2/gnu/microblaze/linux_toolchain/lin64_le/bin:/srv/Xilinx/SDK/2017.2/gnu/aarch32/lin/gcc-arm-linux-gnueabi/bin:/srv/Xilinx/SDK/2017.2/gnu/aarch32/lin/gcc-arm-none-eabi/bin:/srv/Xilinx/SDK/2017.2/gnu/aarch64/lin/aarch64-linux/bin:/srv/Xilinx/SDK/2017.2/gnu/aarch64/lin/aarch64-none/bin:/srv/Xilinx/SDK/2017.2/gnu/armr5/lin/gcc-arm-none-eabi/bin:/srv/Xilinx/SDK/2017.2/tps/lnx64/cmake-3.3.2/bin:/srv/Xilinx/Vivado_HLS/2017.2/bin:/srv/Xilinx/Vivado/2017.2/bin:$PATH


if [ "$HOSTNAME" = "hpvmfpga1" ]; then
  echo "On hpvmfpga1.cs.illinois.edu"
  module load gcc
  export QUARTUSBIN=$QUARTUS_ROOTDIR/bin
  export LOCAL_WORKSPACE=/srv/local/aejjeh
  export HPVM_FPGA_ROOT=$LOCAL_WORKSPACE/hpvm/hpvm
  export LLVM_SRC_ROOT=$HPVM_FPGA_ROOT/llvm 
  export PATH=$HOME/.local/bin:$LLVM_SRC_ROOT/../build/bin:$LLVM_4_ROOT/build/bin:$LLVM_39_ROOT/build/bin:$PATH
  export CC=$LLVM_SRC_ROOT/../build/bin/clang
  export CXX=$LLVM_SRC_ROOT/../build/bin/clang++
  alias cmake=/snap/bin/cmake

fi

if [ "$HOSTNAME" = "miranda" ]; then
  echo "On miranda.cs.illinois.edu"
  module load gcc
  export QUARTUSBIN=$QUARTUS_ROOTDIR/bin
  export PATH=$HOME/.local/bin:$LLVM_SRC_ROOT/../build/bin:$QUARTUSBIN/quartus:$PATH
  export CC=$LLVM_SRC_ROOT/../build/bin/clang
  export CXX=$LLVM_SRC_ROOT/../build/bin/clang++
  alias cmake=/snap/bin/cmake
fi

export PS1='\[\033[01;36m\]\W\[\033[00m\]> '

alias report='aocl report main.visc.ll.kernels.aocx profile.mon'

#bash -c zsh
