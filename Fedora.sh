
# wget https://download.fedoraproject.org/pub/fedora/linux/releases/37/Container/x86_64/images/Fedora-Container-Base-37-1.7.x86_64.tar.xz


sudo bash -c 'echo "[boot]
systemd=true" > /etc/wsl.conf'


# Gnome Tweaks ---- Extensões

sudo systemctl start sshd

cd &&
echo '# DNF - Fedora
fastestmirror=True
max_parallel_downloads=4
defaultyes=True
keepcache=True' >> /etc/dnf/dnf.conf &&
dnf clean dbcache &&
dnf clean all &&
dnf -y update


dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm &&
dnf -y groupupdate core &&
dnf -y install flatpak &&
yes "" | flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo &&
dnf -y groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin &&
dnf -y groupupdate sound-and-video &&
dnf -y install kernel-devel wget bc dwarves &&
dnf -y install snapd &&
sudo ln -s /var/lib/snapd/snap /snap


# Programas Desenvolvimento
sudo dnf -y install htop \
git-lfs \
timeshift


########################################################################################################################################################################################################

useradd -mg users -G wheel -s /bin/bash alvaroico

passwd
passwd alvaroico

exit
# C:\WSL2\Fedora\Fedora.exe config --default-user alvaroico
# wsl --import alvaroico C:\wsl C:\wsl\layer.tar
# wsl -d Fedora -u alvaroico --cd /home/alvaroico/dev


########################################################################################################################################################################################################
# Com usuario local 
# Docker
sudo dnf -y install dnf-plugins-core &&
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo &&
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo usermod -aG docker $USER &&
sudo gpasswd -a $USER docker &&
sudo systemctl start docker &&
sudo systemctl enable docker

sudo dnf -y install kubernetes helm redhat-lsb-core &&
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" &&
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl &&
sudo usermod -aG kube $USER &&
sudo gpasswd -a $USER kube
exit

# Download mais rapido Docker
sudo su
echo '{
    "max-concurrent-uploads": 10,
    "max-concurrent-downloads": 10
}' >> /etc/docker/daemon.json


minikube start

# instal ASDF 
sudo dnf -y install curl git &&
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.1


echo '# ASDF
. $HOME/.asdf/asdf.sh
#Completions 
. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc

------------------------------------------
echo '# ASDF 
. $HOME/.asdf/asdf.sh
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSHs compinit
autoload -Uz compinit && compinit' >> ~/.zshrc

exit

asdf plugin list all &&
asdf plugin-add nodejs &&
asdf list all nodejs

asdf install nodejs lts-fermium && 
asdf install nodejs lts-gallium && 
asdf install nodejs lts-hydrogen && 
asdf install nodejs 14.16.0 && 
asdf global nodejs lts-hydrogen

echo 'alias node-fermium="asdf global nodejs lts-fermium"' >> /home/alvaroico/.bashrc &&
echo 'alias node-gallium="asdf global nodejs lts-gallium"' >> /home/alvaroico/.bashrc &&
echo 'alias node-hydrogen="asdf global nodejs lts-hydrogen"' >> /home/alvaroico/.bashrc &&
echo 'alias node-14.16.0="asdf global nodejs 14.16.0"' >> /home/alvaroico/.bashrc &&
echo 'alias npmicrefisa="npm i --registry=https://npm-corp.local --strict-ssl=false"' >> /home/alvaroico/.bashrc

exit

node-gallium
npm install -g yarn @nestjs/cli typescript react-native
node-fermium
npm install -g yarn @nestjs/cli typescript react-native
node-14.16.0
npm install -g yarn @nestjs/cli typescript react-native
node-hydrogen
npm install -g yarn @nestjs/cli typescript react-native

# Deno
asdf plugin-add deno &&
asdf list all deno &&
asdf install deno 1.28.1 &&
asdf global deno 1.28.1

# ASDF Python Install
sudo dnf -y install make gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel xz-devel libuuid-devel gdbm-devel libnsl2-devel &&
asdf plugin-add python &&
asdf list all python &&
asdf install python 3.11.0 &&
asdf global python 3.11.0

================================
# ASDF Java Install

asdf plugin-add java &&
asdf list all java &&
asdf install java openjdk-19.0.1 &&
asdf install java temurin-11.0.17+8 &&
asdf global java temurin-11.0.17+8 &&
echo '. $HOME/.asdf/plugins/java/set-java-home.bash' >> ~/.bashrc &&
echo '. $HOME/.asdf/plugins/java/set-java-home.zsh' >> ~/.zshrc

================================
# ASDF Dotnet Install

asdf plugin-add dotnet-core &&
asdf list all dotnet-core &&
asdf install dotnet-core 7.0.100 &&
asdf global dotnet-core 7.0.100 &&
echo '. $HOME/.asdf/plugins/dotnet-core/set-dotnet-home.bash' >> ~/.bashrc &&
echo '. $HOME/.asdf/plugins/dotnet-core/set-dotnet-home.zsh' >> ~/.zshrc

================================
# ASDF Erlang Elixir Install

sudo dnf -y install automake autoconf wxBase3-devel wxGTK3-devel &&
asdf plugin-add erlang &&
asdf list all erlang &&
asdf install erlang 25.1.2 &&
asdf global erlang 25.1.2 &&
asdf plugin-add elixir &&
asdf list all elixir &&
asdf install elixir 1.14.2-otp-25 &&
asdf global elixir 1.14.2-otp-25

mix archive.install hex phx_new

================================
# ASDF Ruby Install

asdf plugin-add ruby &&
asdf list all ruby &&
asdf install ruby 3.1.2 &&
asdf global ruby 3.1.2 

================================
# ASDF Go Install 
asdf plugin-add golang &&
asdf list all golang &&
asdf install golang 1.19.3 &&
asdf global golang 1.19.3

================================
# ASDF Rust Cargo Install 
asdf plugin-add rust &&
asdf list all rust &&
asdf install rust 1.65.0 &&
asdf global rust 1.65.0 


# ASDF PHP e Compose Install 
sudo dnf -y install re2c libcurl-devel gd-devel gcc-c++ oniguruma-devel libpq-devel libzip-devel &&
asdf plugin-add php &&
asdf list all php &&
asdf install php 8.1.13 &&
asdf global php 8.1.13

================================
# Xdebug PHP Install 

# ========================
# https://xdebug.org/wizard

sudo curl https://xdebug.org/files/xdebug-3.1.5.tgz -o /tmp/xdebug-3.1.5.tgz &&
cd /tmp &&
tar -xvzf xdebug-3.1.5.tgz &&
cd xdebug-3.1.5 &&
phpize &&
./configure &&
make &&
cp modules/xdebug.so /home/alvaroico/.asdf/installs/php/8.1.13/lib/php/extensions/no-debug-non-zts-20210902 &&
sudo bash -c 'echo "zend_extension = xdebug
[Xdebug]
xdebug.mode = debug
xdebug.start_with_request = yes
xdebug.client_port = 9000" > /home/alvaroico/.asdf/installs/php/8.1.13/conf.d/99-xdebug.ini'

########################################################################################################################################################################################################

# Android Studio Install
sudo dnf -y install zlib.i686 ncurses-libs.i686 bzip2-libs.i686
# Baixar manual
# https://developer.android.com/studio

wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2021.3.1.17/android-studio-2021.3.1.17-linux.tar.gz &&
tar -xvzf android-studio-2021.3.1.17-linux.tar.gz &&
sudo rm -r android-studio-2021.3.1.17-linux.tar.gz &&
sudo mv android-studio /opt/ &&
/opt/android-studio/bin/studio.sh

# Instalar dependencias Android Studio
echo '# ADB Android PATH
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools' >> ~/.bashrc


echo '# ADB Android PATH
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools' >> ~/.zshrc


# Google Chrome
sudo rpm --import https://dl.google.com/linux/linux_signing_key.pub &&
sudo dnf config-manager --add-repo https://dl.google.com/linux/chrome/rpm/stable/x86_64 &&
dnf check-update &&
sudo dnf -y install google-chrome-stable

echo '# Chrome PATH
export PATH=$PATH:/opt/google/chrome' >> ~/.bashrc

echo '# Chrome PATH
export PATH=$PATH:/opt/google/chrome' >> ~/.zshrc

# Flutter
sudo dnf -y install clang cmake ninja-build pkg-config gtk3-devel xz-devel &&
git clone https://github.com/flutter/flutter.git -b stable .flutter &&
echo '# Flutter
export PATH="$PATH:$HOME/.flutter/bin"' >> ~/.bashrc

echo '# Flutter
export PATH="$PATH:$HOME/.flutter/bin"' >> ~/.zshrc

flutter doctor --android-licenses &&
flutter doctor -v


########################################################################################################################################################################################################

cd &&
mkdir dev &&
cd dev &&
mkdir lab &&
mkdir hub &&
mkdir cm2tech &&
mkdir cbyk &&
mkdir einstein &&
mkdir crefisa

########################################################################################################################################################################################################
python --version &&
pip --version &&
node -v &&
npm -v &&
yarn -v &&
java --version &&
dotnet --version &&
erl -version &&
elixir --version &&
ruby --version &&
go version &&
cargo --version &&
php -v &&
composer --version &&
git-lfs --version &&
adb --version


########################################################################################################################################################################################################

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc &&
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge &&
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/vscode &&
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/ms-teams &&
sudo dnf check-update &&
sudo dnf -y install icu code microsoft-edge-stable teams
# sudo snap install teams

# DBeaver CE
sudo rpm -Uvh https://dbeaver.io/files/dbeaver-ce-latest-stable.x86_64.rpm

wget https://dl.pstmn.io/download/latest/linux64 &&
tar -xvzf linux64 &&
sudo rm -r linux64 &&
sudo mv Postman /opt/ &&
sudo ln -s /opt/Postman/Postman /usr/local/bin/postman &&
sudo bash -c 'echo "[Desktop Entry]
Name=Postman
GenericName=API Client
X-GNOME-FullName=Postman API Client
Comment=Make and view REST API calls and responses
Keywords=api;
Exec=/usr/local/bin/postman
Terminal=false
Type=Application
Icon=/opt/Postman/app/resources/app/assets/icon.png
Categories=Development;Utilities;" >> /usr/share/applications/postman.desktop'

# OBS-studio
sudo dnf -y install obs-studio

# flatpak -y install flathub com.visualstudio.code &&
# flatpak -y install flathub io.dbeaver.DBeaverCommunity &&
sudo flatpak -y install flathub app.resp.RESP &&
# flatpak -y install flathub com.getpostman.Postman &&
# flatpak -y install flathub com.obsproject.Studio

# Discord
sudo dnf -y install discord

sudo dnf install gtk2 GConf2
sudo rpm -Uvh https://downloads.mongodb.com/compass/mongodb-compass-1.34.1.x86_64.rpm


=========== # KVM, QEMU ===========

sudo dnf group install --with-optional virtualization &&
sudo systemctl start libvirtd &&
sudo systemctl enable libvirtd

===================================
echo 'alias vpn-einstein-dev="sudo openvpn --config /home/alvaroico/.vpn/Einstein/alvaro.pereira-dev/downloaded-client-config.ovpn"' >> /home/alvaroico/.bashrc