set -x
set -e

# 软件源
# perl -pi.bak -e "s/archive\.ubuntu\.com/mirrors.aliyun.com/g" /etc/apt/sources.list
apt update
apt upgrade -y

# 时区(dpkg-reconfigure tzdata)
printf "%s\n" '6' '70' | apt install -y tzdata

# 基本工具
apt install -y bash-completion less file zip unzip vim bc fizsh zsh-antigen zsh-autosuggestions

# 实用工具
if ((1)); then
    apt install -y procps lsof netcat iftop sysstat tcpdump openssl curl wget
    # 实用工具
    apt install -y procps linux-tools-common lsof netcat net-tools iftop sysstat tcpdump iproute2 openssl curl wget
    # python3
    apt install -y python3 python3-dev python3-pip python3-cryptography
    mkdir -p ~/.pip
    printf '%s' \
'[global]
index-url=https://mirrors.aliyun.com/pypi/simple/
' > ~/.pip/pip.conf
fi

# C++开发工具
if ((1)); then
    apt install -y autoconf automake make libtool pkg-config ninja-build diffutils patchelf gcc g++ gdb nasm gfortran  libgomp1
    apt install -y cmake cmake-curses-gui
    apt install -y lld clang lldb llvm-dev libomp-dev clangd clang-format clang-tidy
    ln -s `which lld` /usr/local/bin/ld
fi

# python3
if ((1)); then
    apt install -y python3-setuptools python3-wheel black
    pip3 install aiohttp[speedups] aiomysql uvloop
fi

# ssh
if ((1)); then
    apt install -y openssh-server openssh-sftp-server
    perl -pi -e 's/#(PermitRootLogin).*/$1 yes/g' /etc/ssh/sshd_config
    /etc/init.d/ssh start #启动一次，自动准备好运行环境
    # 运行命令:  /usr/sbin/sshd -D -p 9999
fi

# ---- 运维配置 --------------------------------------------------------
# 必须放最后，避免apt安装时遇到配置冲突问题

printf '%s\n' \
'fs.file-max=524288' \
'fs.inotify.max_user_watches=524288' \
>> /etc/sysctl.conf
# sysctl -p

perl -pi -e 's/.*(DefaultLimitNOFILE).*/$1=524288/g' /etc/systemd/user.conf
perl -pi -e 's/.*(DefaultLimitNOFILE).*/$1=524288/g' /etc/systemd/system.conf

printf '%s\n' \
'* soft nofile 524288' \
'* hard nofile 524288' \
>> /etc/security/limits.conf

# bash常用设置
printf '%s' \
'#-----------------------------------------------------------------
export LC_ALL=C.UTF-8

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls="ls --color=auto"
    alias dir="dir --color=auto"
    alias vdir="vdir --color=auto"

    alias grep="grep --color=auto"
    alias fgrep="fgrep --color=auto"
    alias egrep="egrep --color=auto"
fi

# some more ls aliases
alias ll="ls -l"
alias la="ls -A"
alias l="ls -CF"

# colored GCC warnings and errors
export GCC_COLORS="error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"

if [ -z "${B1F89D1E_E51F_4BA3_8382_A3749DEE2E4A}" ] ; then
    export B1F89D1E_E51F_4BA3_8382_A3749DEE2E4A=1
    # 只执行一次的命令
    
fi
' | tee -a /etc/bash.bashrc /etc/zsh/zshrc

printf '%s' \
'
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
' | tee -a /etc/bash.bashrc
