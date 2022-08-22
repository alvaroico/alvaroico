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
zypper dup --from "Packman Repository" --allow-vendor-change


https://pt.opensuse.org/Reposit%C3%B3rios_adicionais_de_pacotes


# 4. Install Drivers
https://www.opensuse-community.org/
https://youtu.be/elWC9gYDNnA

# 5. Install Codecs
https://www.opensuse-community.org/
clica so nos 2 primeiros links


# 6. Install Microsoft fonts
Buscar nos pacotes YaST > fetchmsttfonts

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



# Instalar o Git e as chaves GPG
sudo zypper install git git-lfs


# Base Deve
sudo zypper install zram-generator \
kernel-devel \
bc \
dwarves \
libicu \
patterns-devel-base-devel_basis \
libopenssl-devel 

# PHP
sudo zypper install php8 \
php8-xdebug \
php-composer2


# Programas Desenvolvimento
sudo zypper install fira-code-fonts \
htop \
go \
rust \
cargo \
discord

# Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc &&
sudo zypper addrepo https://packages.microsoft.com/yumrepos/vscode vscode &&
sudo zypper addrepo https://packages.microsoft.com/yumrepos/edge edge &&
sudo zypper addrepo https://packages.microsoft.com/yumrepos/ms-teams ms-teams &&
sudo zypper addrepo https://packages.microsoft.com/opensuse/15/prod dotnet &&
sudo zypper refresh &&
sudo zypper install code \
microsoft-edge-stable \
teams \
dotnet-sdk-6.0 \
aspnetcore-runtime-6.0 \
dotnet-runtime-6.0 \
dotnet-host \
dotnet-targeting-pack-6.0


# Docker
sudo zypper install docker &&
sudo usermod -aG docker $USER &&
sudo gpasswd -a $USER docker &&
sudo systemctl start docker &&
sudo systemctl enable docker

sudo zypper install minikube kubernetes-kubeadm helm

# sudo docker run hello-world

# ASDF e NodeJS
sudo zypper install curl git &&
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2 &&
echo '# ASDF
. $HOME/.asdf/asdf.sh' >> ~/.bashrc &&
echo '# ASDF Completions 
. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc

exit

asdf plugin list all &&
asdf plugin-add nodejs &&
asdf list all nodejs

asdf install nodejs 18.7.0 &&
asdf install nodejs lts && 
asdf global nodejs 18.7.0

echo 'alias nodebeta="asdf global nodejs 18.7.0"' >> /home/alvaroico/.bashrc
echo 'alias nodelts="asdf global nodejs lts"' >> /home/alvaroico/.bashrc 

npm install -g yarn @nestjs/cli typescript

# Google Chrome
sudo rpm --import https://dl.google.com/linux/linux_signing_key.pub &&
sudo zypper ar http://dl.google.com/linux/chrome/rpm/stable/x86_64 Google-Chrome &&
sudo zypper update &&
sudo zypper ref &&
sudo zypper install google-chrome-stable &&
echo '# Chrome PATH
export PATH=$PATH:/opt/google/chrome' >> ~/.bashrc

# elixir
sudo zypper install elixir &&
mix archive.install hex phx_new

# Flutter
git clone https://github.com/flutter/flutter.git -b stable .flutter &&
echo '# Flutter
export PATH="$PATH:$HOME/.flutter/bin"' >> ~/.bashrc

exit 

# Instalar flatpak
sudo zypper install flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# flatpak -y install flathub com.visualstudio.code &&
sudo flatpak -y install flathub io.dbeaver.DBeaverCommunity &&
sudo flatpak -y install flathub app.resp.RESP &&
# sudo flatpak -y install flathub com.google.AndroidStudio &&
sudo flatpak -y install flathub com.getpostman.Postman &&
sudo flatpak -y install flathub com.obsproject.Studio

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

# Flutter config android studio manual Download
sudo zypper install clang cmake ninja gtk3-devel
flutter config --android-studio-dir /opt/android-studio &&
flutter config --android-sdk ~/Android/Sdk &&
flutter doctor --android-licenses &&
flutter precache &&
flutter doctor -v

# Adicionais
sudo zypper install gnome-keyring libsecret libgnome-keyring \
aspell-pt_BR \
keepass


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
