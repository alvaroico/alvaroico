# 1. Update System
sudo zypper ref && sudo zypper up

sudo zypper dup

# 2. Create System Snapshot
# Tast e fazer o snapshot do sistema

# 3. Add Community Repositories
YaST > repositories > Add > Community Repostories > Pacman > Add

zypper ar -cfp 90 http://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/ packman

rodar comando DUP
Packman Repository
sudo zypper dup --from "Packman Repository" --allow-vendor-change


https://pt.opensuse.org/Reposit%C3%B3rios_adicionais_de_pacotes


# 4. Install Drivers
https://www.opensuse-community.org/
https://youtu.be/elWC9gYDNnA

# 5. Install Codecs
https://www.opensuse-community.org/
clica so nos 2 primeiros links


# 6. Install Microsoft fonts Instalar o Git e as chaves GPG
sudo zypper install fetchmsttfonts git git-lfs htop curl wget

# 7. Decrease  swappiness

cat /proc/sys/vm/swappiness

mudar do 60 para 10 com o comando 

sudo nano /etc/sysctl.conf

adicionar 

vm.swappiness = 10

cat /proc/sys/vm/swappiness

# 8. Disable GRUB delay
Gosto do padrão
# 9. Disable Click to open files
Gosto do padrão

# 10. Uninstall Discover
discover

# 11. Install Java
ja vem instalado o java 11
# 12. Install build essentials
# Base Deve
sudo zypper install zram-generator \
kernel-devel \
bc \
dwarves \
libicu \
patterns-devel-base-devel_basis \
libopenssl-devel 

# /etc/systemd/zram-generator.conf
[zram0]
zram-size = ram / 2


# Programas
sudo zypper install discord

# Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc &&
sudo zypper addrepo https://packages.microsoft.com/yumrepos/vscode vscode &&
sudo zypper addrepo https://packages.microsoft.com/yumrepos/edge edge &&
sudo zypper addrepo https://packages.microsoft.com/yumrepos/ms-teams ms-teams &&
sudo zypper refresh &&
sudo zypper install code \
microsoft-edge-stable \
teams

# Docker
sudo zypper install docker minikube kubernetes-kubeadm helm &&
sudo usermod -aG docker $USER &&
sudo gpasswd -a $USER docker &&
sudo systemctl start docker &&
sudo systemctl enable docker

# sudo docker run hello-world

# ASDF e NodeJS
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.1 &&
echo '# ASDF
. $HOME/.asdf/asdf.sh
# ASDF Completions 
. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc

echo '# ASDF 
. /opt/asdf-vm/asdf.sh
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

echo 'alias node-fermium="asdf global nodejs lts-fermium"
alias node-gallium="asdf global nodejs lts-gallium"
alias node-hydrogen="asdf global nodejs lts-hydrogen"
alias node-14.16.0="asdf global nodejs 14.16.0"
alias npmicrefisa="npm i --registry=https://npm-corp.local --strict-ssl=false"
' >> ~/.bashrc &&
echo 'alias node-fermium="asdf global nodejs lts-fermium"
alias node-gallium="asdf global nodejs lts-gallium"
alias node-hydrogen="asdf global nodejs lts-hydrogen"
alias node-14.16.0="asdf global nodejs 14.16.0"
alias npmicrefisa="npm i --registry=https://npm-corp.local --strict-ssl=false"
' >> ~/.zshrc

exit

node-hydrogen
npm install -g yarn pnpm @nestjs/cli typescript react-native
node-gallium
npm install -g yarn pnpm @nestjs/cli typescript react-native
node-fermium
npm install -g yarn pnpm @nestjs/cli typescript react-native
node-14.16.0
npm install -g yarn pnpm @nestjs/cli typescript react-native
node-hydrogen

# Deno
asdf plugin-add deno &&
asdf list all deno &&
asdf install deno 1.30.0 &&
asdf global deno 1.30.0


# ASDF Python Install
asdf plugin-add python &&
asdf list all python &&
asdf install python 3.11.1 &&
asdf global python 3.11.1

================================
# ASDF Java Install

asdf plugin-add java &&
asdf list all java &&
asdf install java openjdk-19.0.2 &&
asdf install java temurin-11.0.17+8 &&
asdf global java temurin-11.0.17+8 &&
echo '. $HOME/.asdf/plugins/java/set-java-home.bash' >> ~/.bashrc &&
echo '. $HOME/.asdf/plugins/java/set-java-home.zsh' >> ~/.zshrc

================================
# ASDF Dotnet Install

asdf plugin-add dotnet-core &&
asdf list all dotnet-core &&
asdf install dotnet-core 7.0.102 &&
asdf global dotnet-core 7.0.102 &&
echo '. $HOME/.asdf/plugins/dotnet-core/set-dotnet-home.bash' >> ~/.bashrc &&
echo '. $HOME/.asdf/plugins/dotnet-core/set-dotnet-home.zsh' >> ~/.zshrc

================================
# ASDF Erlang Elixir Install

sudo zypper install libopenssl-devel libconfig++-devel

asdf plugin-add erlang &&
asdf list all erlang &&
asdf install erlang 25.2.2 &&
asdf global erlang 25.2.2 &&
asdf plugin-add elixir &&
asdf list all elixir &&
asdf install elixir 1.14.3-otp-25 &&
asdf global elixir 1.14.3-otp-25

mix archive.install hex phx_new

================================
# ASDF Ruby Install
sudo zypper install libyaml-devel &&
asdf plugin-add ruby &&
asdf list all ruby &&
asdf install ruby 3.2.0 &&
asdf global ruby 3.2.0 

================================
# ASDF Go Install 
asdf plugin-add golang &&
asdf list all golang &&
asdf install golang 1.19.5 &&
asdf global golang 1.19.5

================================
# ASDF Rust Cargo Install 
asdf plugin-add rust &&
asdf list all rust &&
asdf install rust 1.67.0 &&
asdf global rust 1.67.0 


# ASDF PHP e Compose Install 
sudo zypper install re2c libxml2-devel sqlite3-devel libcurl-devel libgd-devel




asdf plugin-add php &&
asdf list all php &&
asdf install php 8.2.1 &&
asdf global php 8.2.1

================================
# Xdebug PHP Install 

# ========================
# https://xdebug.org/wizard

sudo curl https://xdebug.org/files/xdebug-3.2.0.tgz -o /tmp/xdebug-3.2.0.tgz &&
cd /tmp &&
tar -xvzf xdebug-3.2.0.tgz &&
cd xdebug-3.2.0 &&
phpize &&
./configure &&
make &&
cp modules/xdebug.so /home/alvaroico/.asdf/installs/php/8.2.1/lib/php/extensions/no-debug-non-zts-20220829 &&
sudo bash -c 'echo "zend_extension = xdebug
[Xdebug]
xdebug.mode = debug
xdebug.start_with_request = yes
xdebug.client_port = 9000" > /home/alvaroico/.asdf/installs/php/8.2.1/conf.d/99-xdebug.ini'

########################################################################################################################################################################################################

yes "" | yay -S icu69-bin android-studio google-chrome

# Flutter
git clone https://github.com/flutter/flutter.git .flutter
echo '# Flutter
export PATH="$PATH:$HOME/.flutter/bin"' >> ~/.bashrc

echo '# Flutter
export PATH="$PATH:$HOME/.flutter/bin"' >> ~/.zshrc

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

echo '# Chrome PATH
export PATH=$PATH:/opt/google/chrome' >> ~/.bashrc

echo '# Chrome PATH
export PATH=$PATH:/opt/google/chrome' >> ~/.zshrc

flutter doctor --android-licenses &&
flutter doctor -v

# Windows 
# New-Item -ItemType SymbolicLink -Path .\jre -Target .\jbr
# Linux
# ln -s jbr jre


# Google Chrome
sudo rpm --import https://dl.google.com/linux/linux_signing_key.pub &&
sudo zypper ar http://dl.google.com/linux/chrome/rpm/stable/x86_64 Google-Chrome &&
sudo zypper update &&
sudo zypper ref &&
sudo zypper install google-chrome-stable &&
echo '# Chrome PATH
export PATH=$PATH:/opt/google/chrome' >> ~/.bashrc

exit 

# Instalar flatpak
sudo zypper install flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# flatpak -y install flathub com.visualstudio.code &&
# sudo flatpak -y install flathub io.dbeaver.DBeaverCommunity &&
sudo flatpak -y install flathub app.resp.RESP &&
# sudo flatpak -y install flathub com.google.AndroidStudio &&
# sudo flatpak -y install flathub com.getpostman.Postman &&
sudo flatpak -y install flathub com.obsproject.Studio

# Install Postman
wget https://dl.pstmn.io/download/latest/linux64 &&
sudo tar -xzf linux64 &&
rm linux64 &&
sudo mkdir -p /opt/apps/ &&
sudo mv Postman /opt/apps/ &&
sudo ln -s /opt/apps/Postman/Postman /usr/local/bin/postman &&
sudo bash -c 'echo "[Desktop Entry]
Type=Application
Name=Postman
Icon=/opt/apps/Postman/app/resources/app/assets/icon.png
Exec="/opt/apps/Postman/Postman"
Comment=Postman Desktop App
Categories=Development;Code;" > /usr/share/applications/postman.desktop'


# Instal snapd
sudo zypper addrepo --refresh https://download.opensuse.org/repositories/system:/snappy/openSUSE_Tumbleweed snappy &&
sudo zypper --gpg-auto-import-keys refresh &&
sudo zypper dup --from snappy &&
sudo zypper install snapd &&
sudo systemctl enable snapd &&
sudo systemctl start snapd &&
sudo systemctl enable snapd.apparmor &&
sudo systemctl start snapd.apparmor &&
sudo snap install snapd

# Flutter
git clone https://github.com/flutter/flutter.git -b stable .flutter &&
echo '# Flutter
export PATH="$PATH:$HOME/.flutter/bin"' >> ~/.bashrc

# Flutter config android studio manual Download

https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2021.2.1.16/android-studio-2021.2.1.16-linux.tar.gz

echo '# ADB Android PATH
export ANDROID_SDK_ROOT=$HOME/Android/Sdk/
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools' >> ~/.bashrc

sudo zypper install clang cmake ninja gtk3-devel
flutter config --android-studio-dir /opt/android-studio &&
flutter config --android-sdk ~/Android/Sdk &&
flutter doctor --android-licenses &&
flutter precache &&
flutter doctor -v

# Adicionais
sudo zypper install aspell-pt_BR \
keepass

# não precisa
# gnome-keyring libsecret libgnome-keyring \


python3 --version &&
pip3 --version &&
node -v &&
npm -v &&
yarn -v &&
java --version &&
dotnet --version &&
elixir --version &&
ruby --version &&
git-lfs --version &&
go version &&
cargo --version &&
adb --version &&
php -v &&
composer --version
kubectl version --short
