old() {
    sudo apt install vim python3-pip i3

    # to setup caps as ctrl
    sudo apt install gnome-tweak-tool


    # gnome theme
    gsettings set org.gnome.desktop.interface gtk-theme "CoolestThemeOnEarth"

    # cisco vpn
    sudo apt-get install network-manager-vpnc


    # java 8
    sudo apt-add-repository ppa:webupd8team/java
    sudo apt-get update
    sudo apt-get install oracle-java8-installer
    sudo update-alternatives --config java
    sudo apt-get install maven

    # node js and npm

    sudo apt-get install -y nodejs npm
    sudo ln -s /usr/bin/node $(which nodejs)

    # git
    sudo apt-get install -y git

    git config --global user.name "me "
    git config --global user.email you@example.com
    git config --global core.excludesfile ~/.gitignore_global

    # gawk for translate
    mkdir -p ~/bin
    wget git.io/trans
    chmod +x trans
    mv trans ~/bin/
    sudo apt-get install -y gawk


    #ruby

    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    curl -sSL https://get.rvm.io | bash -s stable

    sudo apt-get install libsqlite3-dev sqlite3
    rvm install 1.9.3
    gem install vmail
    sudo apt-get install vim-gtk
    sudo apt-get install memcached
    # Requirement already satisfied (use --upgrade to upgrade): i3-py in /usr/local/lib/python2.7/dist-packages
    Cleaning up...


    npm install -g esformatter esformatter-add-trailing-commas esformatter-jsx esformatter-semicolons

    # powerline fonts
    git clone https://github.com/powerline/fonts.git && cd fonts && ./install.sh

}

py() {
    sudo apt install vim python3-pip i3 -y
}

urxvt() {
    sudo apt-get install xfonts-terminus rxvt-unicode -y
    cd /etc/fonts/conf.d/
    sudo rm -rf 70-no-bitmaps.conf && sudo ln -s ../conf.avail/70-yes-bitmaps.conf .
    sudo dpkg-reconfigure fontconfig
}

kitty() {
     curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
}

vim() {
    #edit commit messages with vim
    git config --global core.editor /usr/bin/vim
    mkdir -p ~/.vim/bundle
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    sudo apt-get install silversearcher-ag
    /usr/bin/vim +VundleInstall
}

emacs() {
    sudo add-apt-repository ppa:kelleyk/emacs -y
    sudo apt update
    sudo apt install emacs26 -y
}

youtubeviewer() {
    # youtube-viewer
    sudo apt install git libncurses5-dev libtinfo-dev libreadline-dev pkg-config libgtk2.0-dev libcanberra-gtk-module

    git clone https://github.com/trizen/youtube-viewer
    cd youtube-viewer
    sudo cpan install CPAN ExtUtils::PkgConfig Module::Build inc::latest PAR::Dist Term::ReadLine::Gnu::XS Unicode::GCString LWP::Protocol::https Data::Dump JSON
    perl Build.PL
    sudo ./Build installdeps
    sudo ./Build install
}

st() {
    git clone https://github.com/lukesmithxyz/st
    cd st
    sudo apt-get install libxft-dev libx11-dev
    make
    sudo make install
}


i3() {
    sudo apt-get install i3blocks
    sudo pip3 install i3-py
    sudo pip3 install quickswitch-i3
}

rxvtfontsize() {
    mkdir -p $HOME/.urxvt/ext
    cd $HOME/.urxvt/ext
    wget https://github.com/majutsushi/urxvt-font-size/raw/master/font-size

}

base() {
    py
    sudo apt-get install zsh silversearcher-ag openvpn -y
}

zsh() {
    sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

}

$1
