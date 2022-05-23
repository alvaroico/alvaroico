
# wget https://download.fedoraproject.org/pub/fedora/linux/releases/36/Container/x86_64/images/Fedora-Container-Base-36-1.5.x86_64.tar.xz
# Gnome Tweaks ---- Extensões

cd &&
echo '# DNF - Fedora
fastestmirror=True
max_parallel_downloads=10
defaultyes=True
keepcache=True' >> /etc/dnf/dnf.conf &&
dnf clean dbcache &&
dnf clean all &&
dnf -y update &&
dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm &&
dnf -y groupupdate core &&
dnf -y install flatpak &&
yes "" | flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo &&
dnf -y groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin &&
dnf -y groupupdate sound-and-video &&
dnf -y install kernel-devel wget bc dwarves &&
dnf -y install snapd


# Programas Desenvolvimento
dnf -y install google-noto-emoji-fonts \
cascadia-code-fonts \
htop \
nano \
git \
git-lfs \
openssh \
python3-pip \
java-latest-openjdk \
elixir \
golang \
rust \
cargo \
ruby \
dotnet-host \
dotnet-sdk-6.0 \
dotnet-runtime-6.0 \
dotnet-targeting-pack-6.0 \
android-tools \
php \
composer \
icu


########################################################################################################################################################################################################

useradd -mg users -G wheel -s /bin/bash alvaroico

passwd
passwd alvaroico

exit
# C:\WSL2\Fedora\Fedora.exe config --default-user alvaroico
# wsl -d Fedora


########################################################################################################################################################################################################
# Com usuario local 
# Docker
sudo dnf -y install dnf-plugins-core &&
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo &&
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin


# minikube
sudo rpm -Uvh https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm

# NodeJS
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

exit

nvm install --lts &&
npm install -g npm yarn &&
mix archive.install hex phx_new

# Flutter
git clone https://github.com/flutter/flutter.git -b stable .flutter
echo '# Flutter
export PATH="$PATH:`pwd`/.flutter/bin"' >> ~/.bashrc

# PHP X Debug
sudo dnf -y install php-devel &&
mkdir temp &&
cd temp &&
wget https://xdebug.org/files/xdebug-3.1.4.tgz &&
tar -xvzf xdebug-3.1.4.tgz &&
cd xdebug-3.1.4 &&
phpize &&
./configure &&
make &&
sudo cp modules/xdebug.so /usr/lib64/php/modules &&
sudo bash -c 'echo "zend_extension = xdebug
[Xdebug]
xdebug.mode = debug
xdebug.start_with_request = yes
xdebug.client_port = 9000" >> /etc/php.d/99-xdebug.ini' &&
cd .. &&
cd .. &&
sudo rm -r temp 

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc &&
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge &&
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/vscode &&
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/ms-teams &&
sudo dnf check-update &&
sudo dnf -y install code microsoft-edge-stable teams
# sudo snap install teams

# Google Chrome
sudo rpm --import https://dl.google.com/linux/linux_signing_key.pub &&
sudo dnf config-manager --add-repo https://dl.google.com/linux/chrome/rpm/stable/x86_64 &&
dnf check-update &&
sudo dnf -y install google-chrome-stable

sudo rpm -Uvh https://dbeaver.io/files/dbeaver-ce-latest-stable.x86_64.rpm
# flatpak -y install flathub io.dbeaver.DBeaverCommunity

flatpak -y install --from https://dl.flathub.org/repo/appstream/app.resp.RESP.flatpakref &&
flatpak -y install --from https://dl.flathub.org/repo/appstream/com.google.AndroidStudio.flatpakref &&
flatpak -y install --from https://dl.flathub.org/repo/appstream/com.getpostman.Postman.flatpakref &&
flatpak -y install --from https://dl.flathub.org/repo/appstream/com.obsproject.Studio.flatpakref




echo '# Chrome PATH
export PATH=$PATH:/opt/google/chrome' >> /home/alvaroico/.bashrc


sudo dnf -y install clang cmake ninja-build ninja-build gtk3-devel
flutter config --android-studio-dir /var/lib/flatpak/app/com.google.AndroidStudio/x86_64/stable/1769d55e98c79a5fdc23b7705275d9c24093722d504770f670ac6d4d6808d37b/files/extra/android-studio &&
flutter config --android-sdk /home/alvaroico/Android/Sdk &&
flutter doctor --android-licenses &&
flutter precache &&
flutter doctor -v

sudo usermod -aG docker alvaroico &&
sudo gpasswd -a alvaroico docker


sudo systemctl enable docker

=========== # KVM, QEMU ===========

sudo dnf group install --with-optional virtualization &&
sudo systemctl start libvirtd &&
sudo systemctl enable libvirtd

# sudo dnf -y install qemu virt-manager virt-viewer dnsmasq bridge-utils netcat libguestfs


# sudo systemctl enable libvirtd.service
# sudo systemctl start libvirtd.service

# sudo nano /etc/libvirt/libvirtd.conf

# sudo sed -i -e 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/g' /etc/libvirt/libvirtd.conf

# sudo sed -i -e 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/g' /etc/libvirt/libvirtd.conf


# sudo usermod -a -G libvirt $(whoami)
# newgrp libvirt


# sudo systemctl restart libvirtd.service


===================================





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
