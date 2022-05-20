
# wget https://download.fedoraproject.org/pub/fedora/linux/releases/36/Container/x86_64/images/Fedora-Container-Base-36-1.5.x86_64.tar.xz
# Gnome Tweaks ---- Extenions

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
composer


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
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm &&
sudo rpm -Uvh minikube-latest.x86_64.rpm
rm -r minikube-latest.x86_64.rpm

# NodeJS
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

exit

nvm install --lts &&
npm install -g npm yarn &&
mix archive.install hex phx_new

# Flutter
sudo snap install flutter --classic
flutter config --android-studio-dir /opt/android-studio/ &&
flutter config --android-sdk /home/alvaroico/Android/Sdk &&
flutter doctor --android-licenses &&
flutter precache &&
flutter doctor -v

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

sudo snap install teams

flatpak install --from https://dl.flathub.org/repo/appstream/app.resp.RESP.flatpakref
flatpak install --from https://dl.flathub.org/repo/appstream/com.google.AndroidStudio.flatpakref
flatpak install --from https://dl.flathub.org/repo/appstream/com.google.Chrome.flatpakref
flatpak install --from https://dl.flathub.org/repo/appstream/com.microsoft.Edge.flatpakref
flatpak install --from https://dl.flathub.org/repo/appstream/com.getpostman.Postman.flatpakref
flatpak install --from https://dl.flathub.org/repo/appstream/com.visualstudio.code.flatpakref
flatpak install --from https://dl.flathub.org/repo/appstream/com.obsproject.Studio.flatpakref



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