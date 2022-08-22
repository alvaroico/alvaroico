
# Dev Terminal
# pamac install base-devel python bc pahole wget nano
# pamac install libreoffice-fresh

sudo sed -i -e 's/#ParallelDownloads = 5/ParallelDownloads = 50/g' /etc/pacman.conf 

pamac install gnome-keyring \
plasma-wayland-session \
aspell-pt \
keepass \
discord \
dbeaver \
obs-studio \
ttf-cascadia-code \
dart \
php \
xdebug \
composer \
git-lfs \
elixir \
go \
rust \
ruby \
dotnet-host \
dotnet-sdk \
dotnet-runtime \
dotnet-targeting-pack \
aspnet-runtime \
docker \
docker-compose \
minikube \
kubectl \
noto-fonts-emoji \
ttf-cascadia-code \
noto-fonts-cjk

==========================

pamac build microsoft-edge-stable-bin \
epson-inkjet-printer-escpr \
visual-studio-code-bin \
google-chrome \
android-studio \
mongodb-compass \
postman-bin \
teams \
robo3t-bin \
asdf-vm \
flutter \
php-pdo_sqlsrv \
icu69-bin

# Ta com Erro
# pamac build resp-app mongodb-shell-bin mongodb-tools-bin 

flatpak install --from https://dl.flathub.org/repo/appstream/app.resp.RESP.flatpakref

sudo usermod -aG docker $USER &&
sudo gpasswd -a $USER docker 

sudo systemctl enable docker


sudo bash -c 'echo "zend_extension = /usr/lib/php/modules/xdebug.so
[Xdebug]
xdebug.mode = debug
xdebug.start_with_request = yes
xdebug.client_port = 9000" >> /etc/php/php.ini' &&
echo '# Chrome PATH
export PATH=$PATH:/opt/google/chrome' >> /home/alvaroico/.bashrc &&
echo '# Docker BuidKit
export DOCKER_BUILDKIT=1' >> /home/alvaroico/.bashrc &&
echo '# ADB Android PATH
export PATH=$PATH:/home/alvaroico/Android/Sdk/platform-tools' >> /home/alvaroico/.bashrc

# sudo chown $USER /dev/kvm &&
# ls -al /dev/kvm &&
# android-studio
# echo '# NVM
# source /usr/share/nvm/init-nvm.sh' >> /home/alvaroico/.bashrc &&
# nvm install --lts

echo '# ASDF
. /opt/asdf-vm/asdf.sh' >> /home/alvaroico/.bashrc 


asdf plugin list all &&
asdf plugin-add nodejs &&
asdf list all nodejs

asdf install nodejs 10.24.1 && 
asdf install nodejs lts && 
asdf global nodejs lts

echo 'alias node10="asdf global nodejs 10.24.1"' >> /home/alvaroico/.bashrc 
echo 'alias nodelts="asdf global nodejs lts"' >> /home/alvaroico/.bashrc 

# echo 'nodejs 10.24.1' >> .tool-versions

sudo pacman -S clang cmake ninja

sudo chown -R $USER /opt/flutter &&
flutter config --android-studio-dir /opt/android-studio/ &&
flutter config --android-sdk /home/alvaroico/Android/Sdk &&
flutter doctor --android-licenses &&
flutter precache &&
flutter doctor -v


npm install -g yarn @nestjs/cli &&
mix archive.install hex phx_new

# cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh


python --version &&
pip --version &&
node -v &&
npm -v &&
yarn -v &&
java --version &&
dotnet --version &&
php -v &&
composer --version &&
elixir --version &&
ruby --version &&
git-lfs --version &&
adb --version &&
go version &&
cargo --version 


# KVM, QEMU

pamac install virt-manager qemu-full vde2 iptables-nft dnsmasq bridge-utils openbsd-netcat edk2-ovmf swtpm

sudo systemctl enable libvirtd.service &&
sudo usermod -a -G libvirt $USER &&
sudo usermod -a -G libvirt-qemu $USER

sudo sed -i -e 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/g' /etc/libvirt/libvirtd.conf

sudo sed -i -e 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/g' /etc/libvirt/libvirtd.conf

# Download mais rapido Docker
sudo su
echo '{
    "max-concurrent-uploads": 10,
    "max-concurrent-downloads": 10
}' >> /etc/docker/daemon.json