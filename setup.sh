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