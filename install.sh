#!/bin/bash
# Red Install Menu

ubuntu ()
{
    echo "Installing Red for Ubuntu 16.04"
    echo "Enter the username of the account the bot will be run as: "
    read name
    apt-get install python3.5-dev python3-pip build-essential libssl-dev libffi-dev git ffmpeg libopus-dev unzip -y
    git clone -b develop --single-branch https://github.com/Twentysix26/Red-DiscordBot.git
    chown -R $name: Red-DiscordBot
    echo "Done installing prerequisites and downloading the bot. Now do cd Red-DiscordBot followed by python3 launcher.py"
    echo "Then select Install Requirements and select the appropriate option in that menu"
    echo "Then you may run the bot by selecting option 1 or 2 on the main menu"
}

alpine()
{
    echo "Installing Red for Alpine Linux"
    echo "Enter the username of the account the bot will be run as: "
    read name
    apk add python3-dev ffmpeg git openssl libffi-dev libsodium-dev g++ make
    git clone -b develop --single-branch https://github.com/Twentysix26/Red-DiscordBot.git
    chown -R $name: Red-DiscordBot
    echo "Done installing prerequisites and downloading the bot. Now do cd Red-DiscordBot followed by python3 launcher.py"
    echo "Then select Install Requirements and select the appropriate option in that menu"
    echo "Then you may run the bot by selecting option 1 or 2 on the main menu"
}

archlinux()
{
    echo "Installing Red for Archlinux"
    echo "Enter the username of the account the bot will be run as: "
    read name
    pacman -S python python-pip git ffmpeg base-devel openssl libffi libsodium
    git clone -b develop --single-branch https://github.com/Twentysix26/Red-DiscordBot.git
    chown -R $name: Red-DiscordBot
    echo "Done installing prerequisites and downloading the bot. Now do cd Red-DiscordBot followed by python3 launcher.py"
    echo "Then select Install Requirements and select the appropriate option in that menu"
    echo "Then you may run the bot by selecting option 1 or 2 on the main menu"
}

centos7()
{
    echo "Installing Red for CentOS 7"
    echo "Enter the username of the account the bot will be run as: "
    read name
    yum -y groupinstall development
    yum -y install https://centos7.iuscommunity.org/ius-release.rpm
    yum -y install yum-utils wget which python35u python35u-pip python35u-devel openssl-devel libffi-devel git opus-devel
    sh -c "$(wget https://gist.githubusercontent.com/mustafaturan/7053900/raw/27f4c8bad3ee2bb0027a1a52dc8501bf1e53b270/latest-ffmpeg-centos6.sh -O -)"
    git clone -b develop --single-branch https://github.com/Twentysix26/Red-DiscordBot.git
    chown -R $name: Red-DiscordBot
    echo "Done installing prerequisites and downloading the bot. Now do cd Red-DiscordBot followed by python3.5 launcher.py"
    echo "Then select Install Requirements and select the appropriate option in that menu"
    echo "Then you may run the bot by selecting option 1 or 2 on the main menu"
}

debian8()
{
    echo "Installing Red for Debian 8"
    echo "Enter the username of the account the bot will be run as: "
    read name
    echo "deb http://httpredir.debian.org/debian jessie-backports main contrib non-free" >> /etc/apt/sources.list
    apt update
    apt install build-essential libssl-dev libffi-dev git ffmpeg libopus-dev unzip -y
    wget https://www.python.org/ftp/python/3.6.0/Python-3.6.0.tgz
    tar xvf Python-3.6.0.tgz
    cd Python-3.6.0
    ./configure --enable-optimizations
    make -j$(nproc)
    make altinstall
    cd ..
    wget https://bootstrap.pypa.io/get-pip.py
    python3.6 get-pip.py
    git clone -b develop --single-branch https://github.com/Twentysix26/Red-DiscordBot.git
    chown -R $name: Red-DiscordBot
    echo "Done installing prerequisites and downloading the bot. Now do cd Red-DiscordBot followed by python3.6 launcher.py"
    echo "Then select Install Requirements and select the appropriate option in that menu"
    echo "Then you may run the bot by selecting option 1 or 2 on the main menu"
}

fedora25()
{
    echo "Installing Red for Fedora 25"
    echo "Enter the username of the account the bot will be run as: "
    read name
    dnf group install 'development tools'
    dnf install wget redhat-rpm-config libffi-devel python3-devel
    dnf install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-25.noarch.rpm
    dnf install ffmpeg opus-devel
    git clone -b develop --single-branch https://github.com/Twentysix26/Red-DiscordBot.git
    chown -R $name: Red-DiscordBot
    echo "Done installing prerequisites and downloading the bot. Now do cd Red-DiscordBot followed by python3 launcher.py"
    echo "Then select Install Requirements and select the appropriate option in that menu"
    echo "Then you may run the bot by selecting option 1 or 2 on the main menu"
}

opensuse422()
{
    echo "Installing Red for OpenSUSE 42.2"
    echo "Enter the username of the account the bot will be run as: "
    read name
    zypper install http://download.opensuse.org/repositories/home:/Rotkraut:/Opt-Python/openSUSE_Leap_42.2/x86_64/opt-python-libpython3-3.6.0-11.1.x86_64.rpm
    zypper install http://download.opensuse.org/repositories/home:/Rotkraut:/Opt-Python/openSUSE_Leap_42.2/x86_64/opt-python36-3.6.0-11.1.x86_64.rpm
    echo "export PATH=/opt/python/bin/:$PATH" >> ~/.bashrc
    zypper install ffmpeg git ca-certificates wget gcc libffi4-gcc48 libffi48-devel make
    wget wget https://bootstrap.pypa.io/get-pip.py
    python3.6 get-pip.py 
    git clone -b develop --single-branch https://github.com/Twentysix26/Red-DiscordBot.git
    chown -R $name: Red-DiscordBot
    echo "Done installing prerequisites and downloading the bot. Now do cd Red-DiscordBot followed by python3.6 launcher.py"
    echo "Then select Install Requirements and select the appropriate option in that menu"
    echo "Then you may run the bot by selecting option 1 or 2 on the main menu"
}

osx()
{
    echo "Installing Red for OSX"
    echo "Enter the username of the account the bot will be run as: "
    read name
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install python3 --with-brewed-openssl
    brew install git
    brew install ffmpeg --with-ffplay
    brew install opus
    git clone -b develop --single-branch https://github.com/Twentysix26/Red-DiscordBot.git
    chown -R $name: Red-DiscordBot
    echo "Done installing prerequisites and downloading the bot."
    echo "Now do cd Red-DiscordBot followed by export PATH=\$PATH:/usr/local/Cellar/opus/1.1.2/lib/ then python3 launcher.py"
    echo "Then select Install Requirements and select the appropriate option in that menu"
    echo "Then you may run the bot by selecting option 1 or 2 on the main menu"
}

PS3='Please enter your choice: '
options=("Ubuntu 16.04" "Alpine Linux" "ArchLinux" "CentOS 7" "Debian 8" "Fedora 25" "OpenSUSE 42.2" "OSX" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Ubuntu 16.04")
            ubuntu
            break
            ;;
        "Alpine Linux")
            alpine
            break
            ;;
        "ArchLinux")
            archlinux
            break
            ;;
        "CentOS 7")
            centos7
            break
            ;;
        "Debian 8")
            debian8
            break
            ;;
        "Fedora 25")
            fedora25
            break
            ;;
        "OpenSUSE 42.2")
            opensuse422
            break
            ;;
        "OSX")
            osx
            break
            ;;
        "Quit")
            break
            ;;
    esac
done