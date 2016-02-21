#!/bin/bash

# Colorize and add text parameters
grn=$(tput setaf 2)             #  	green
txtbld=$(tput bold)             # 	Bold
bldgrn=${txtbld}$(tput setaf 2) #  	green
blu=$(tput setaf 4) 			#  	blue
txtrst=$(tput sgr0)             # 	Reset

echo "${bldgrn}------------------------------haxorware post ubuntu script------------------------------"
#sudo -s

#Translations cleaned
echo "${blu}Cleaning translations...${txtrst}"
touch /etc/apt/apt.conf.d/99translations
echo "Acquire::Languages \"none\";" | sudo tee /etc/apt/apt.conf.d/99translations
rm -rf /var/lib/apt/lists/

#Add repos
echo "${blu}Adding repos...${txtrst}"
sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:linrunner/tlp
sudo add-apt-repository -y ppa:videolan/stable-daily
sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp
sudo add-apt-repository -y ppa:gnome3-team/gnome3
sudo add-apt-repository -y ppa:tualatrix/ppa
sudo add-apt-repository -y ppa:numix/ppa
sudo add-apt-repository -y ppa:freyja-dev/unity-tweak-tool-daily
sudo apt-add-repository -y ppa:fixnix/netspeed
sudo apt-add-repository -y ppa:djcj/screenfetch
sudo add-apt-repository -y ppa:vlijm/takeabreak
sudo add-apt-repository -y ppa:nilarimogard/webupd8
sudo add-apt-repository -y ppa:gnome-terminator/nightly
sudo add-apt-repository -y "ppa:mank319/go-for-it"
sudo add-apt-repository -y ppa:simonschneegans/testing

#Updates
echo "${blu}Updating apt...${txtrst}"
sudo apt-get -y update

#Upgrade
echo "${blu}System upgrading (plz wait)...${txtrst}"
sudo apt-get -y upgrade

#mount drives
echo "${blu}Mounting volumes...${txtrst}"
sudo mkdir /mnt/sda7
sudo mount -t ntfs /dev/sda7 /mnt/sda7

sudo apt-get -f install

#My packages
echo "${blu}Installing bleachbit...${txtrst}"
dpkg -i /mnt/sda7/Install/Linux/Mint\ Packages/bleachbit_1.8_all_ubuntu1404.deb
if [ "$?" = "0" ]; then
	sudo apt-get -f install
	dpkg -i /mnt/sda7/Install/Linux/Mint\ Packages/bleachbit_1.8_all_ubuntu1404.deb
fi
echo "${blu}Installing hostapd (old)...${txtrst}"
dpkg -i /mnt/sda7/Install/Linux/Mint\ Packages/hostapd_1.0-3ubuntu2.1_amd64.deb
if [ "$?" = "0" ]; then
	sudo apt-get -f install
	dpkg -i /mnt/sda7/Install/Linux/Mint\ Packages/hostapd_1.0-3ubuntu2.1_amd64.deb
fi
sudo apt-mark hold hostapd
echo "${blu}Installing pysdm...${txtrst}"
dpkg -i /mnt/sda7/Install/Linux/Mint\ Packages/pysdm_0.4.1-0ubuntu3_all.deb
if [ "$?" = "0" ]; then
	sudo apt-get -f install
	dpkg -i /mnt/sda7/Install/Linux/Mint\ Packages/pysdm_0.4.1-0ubuntu3_all.deb
fi
echo "${blu}Installing Virtual Box...${txtrst}"
dpkg -i /mnt/sda7/Install/Linux/Mint\ Packages/virtualbox-5.0_5.0.10-104061~Ubuntu~trusty_amd64.deb
if [ "$?" = "0" ]; then
	sudo apt-get -f install
	dpkg -i /mnt/sda7/Install/Linux/Mint\ Packages/virtualbox-5.0_5.0.10-104061~Ubuntu~trusty_amd64.deb
fi
echo "${blu}Installing Messenger...${txtrst}"
dpkg -i /mnt/sda7/Install/Linux/Mint\ Packages/Messenger_linux64.deb
if [ "$?" = "0" ]; then
	sudo apt-get -f install
	dpkg -i /mnt/sda7/Install/Linux/Mint\ Packages/Messenger_linux64.deb
fi
echo "${blu}Installing pavucontrol...${txtrst}"
dpkg -i /mnt/sda7/Install/Linux/Mint\ Packages/pavucontrol_2.0-2_amd64.deb
if [ "$?" = "0" ]; then
	sudo apt-get -f install
	dpkg -i /mnt/sda7/Install/Linux/Mint\ Packages/pavucontrol_2.0-2_amd64.deb

#My Scripts
echo "${blu}Deploying myscripts...${txtrst}"
sudo cp /mnt/sda7/Install/Linux/Mint\ Packages/Scripts/* /usr/local/bin/
sudo chmod +x /usr/local/bin/*

echo "${bldgrn}------------------------------Reboot haxorware------------------------------${txtrst}"

exit

#Packages
echo "${blu}Downloading packages and installing (wait for lots of time)...${txtrst}"
sudo apt-get install -y gdebi system-config-samba grub-customizer oracle-java8-installer vlc tlp tlp-rdw gimp gimp-data gimp-plugin-registry gimp-data-extras unrar zip unzip git build-essential ubuntu-tweak unity-tweak-tool numix-gtk-theme numix-icon-theme-circle indicator-netspeed-unity nethogs vnstat xtrlock screenfetch kazam filezilla

sudo apt-get -y install takeabreak
sudo apt-get -y install screenkey
sudo apt-get -y install terminator
sudo apt-get -y install "go-for-it"
sudo apt-get -y install gnome-pie

#Set default terminal
gsettings set org.gnome.desktop.default-applications.terminal exec gnome-terminal

#virtual box users
sudo usermod -a -G vboxusers $USER

#Hotspot
echo "${blu}Installing create_ap - Base for hotspot...${txtrst}"
cd /tmp
git clone "https://github.com/oblique/create_ap"
cd create_ap
make install
cd ~

#Restricted
echo "${blu}Installing restricted stuff...${txtrst}"
sudo apt-get install -y ubuntu-restricted-extras

echo "${bldgrn}------------------------------Reboot haxorware------------------------------${txtrst}"
