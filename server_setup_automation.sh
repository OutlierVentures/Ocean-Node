#!/bin/bash

# CREATE USERS theo AND aron BEFORE RUNNING

# Update system
echo "Updating system..."
echo `apt-get update &&
      yes | apt-get upgrade &&
      yes | apt-get dist-upgrade`
echo "System updated!"

echo "Configuring users..."

# Grant sudo access to relevant users
echo `usermod -aG sudo theo &&
      usermod -aG sudo aron`

# Add public keys for ssh, root access for emergency use only.
echo `mkdir /home/theo/.ssh &&
      touch /home/theo/.ssh/authorized_keys &&
      mkdir /home/aron/.ssh &&
      touch /home/aron/.ssh/authorized_keys &&
      touch /root/.ssh/authorized_keys`
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCzTZKY1vc6uEatEQRhmr5WAzqYucpYe6M07tbBrTbhBshaqTC5oMLQpgY58rQNJuoiJTWpwAHAWQD5qloMOwyGJd5VV94QeG1TpoiHLN1yq4SFcg04XmSe/XAq1XPa7UbAv+1+HFFyxuwE+4KunItSQ/L+NI54Ms219b85xoplQSNelszZ7Vn4LTSie9mwvEWtXM4ShCD77ttcoXprHwcUWJFZZV7ni9Ll/Agsba4iOXmpbI5Y0IX/PiwswwLc+HtGODQMo2lhdviQ+f/9MplDRxqtorm4ySZsxCXrIe5oPH9MjQXaV/exZN8BWqgYAGxAG6v2ZXIe4FwdgBTMNBnH theo" | tee -a /home/theo/.ssh/authorized_keys /root/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAkaAaf0j72U1PXjaXhjJoc8UzyW7GDfJj24UeAWvwYDlGMOoToZ13S8sTMOkBq4hmHfW+EN/CbwW/agdQ+fvUWtr5M7Acm750nkOJk5UDODol7zo2K+TWhoJ9uUFZ8nEATNGqVMq+sUhdjVoSM631EEqWKkaILcMoDodpqGFi0H8OxfclONq+iaHGCkUiaao0EFiBEcGhV4AHHkKIzEinZ//9lvrHND3+qZzwbODVZCKC6QzAa7zzgCWuPnI472TOBRi6YoTsN9zcbRS+qAbZAM+FGmVm44tc/BK1imEUb3ppMpeZ57I8kK9XkMkdg3Pe5FMtq6jKskOBq2rukfOg0Q== aron" | tee -a /home/aron/.ssh/authorized_keys /root/.ssh/authorized_keys

echo "Users configured!"

# Firewall setup
echo "Setting up firewall..."
echo `apt install ufw &&
      ufw default deny incoming &&
      ufw default allow outgoing`
echo `yes | ufw enable`
echo `ufw allow http &&
      ufw allow ssh`
echo "Firewall is up and configured!"
echo `ufw status`

# Docker install
echo "Installing docker..."
echo `curl -fsSL https://get.docker.com -o get-docker.sh &&
      sh get-docker.sh &&
      rm get-docker.sh`
echo "Docker has been installed!"

# Docker firewall fix
echo "Configuring Docker for firewall..."
echo "DOCKER_OPTS=\"--iptables=false\"" >> /etc/default/docker
echo "Docker now plays nicely with the firewall!"

echo "
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMWWNNNNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMNKkoc:;,,,;:coxOXWMMMNkooooooONMMMMMMMMMMW0dooooxXMWXOxxk0NMMM
MMMMMWKd;..           ..,lONMWx.     'kWMMMMMMMMMK:.   .oNNk:,,,,;oKMM
MMMMXo'.     ...''...     .:OWNo.    .;KMMMMMMMMNl.   .cXM0c,,,,,,;xWM
MMM0:.    .'cx0KXXKko;.    .'xWK:.    .lNMMMMMMWx.   .;0MMNd;,,,,,l0WM
MMK:.    .cKWMMMMMMMMXd'     'kWO,     .xWMMMMM0,    'kWMMMN0xdddOXWMM
MWx.    .cXMMMMMMMMMMMWx.    .cXWx.     ,OMMMMXc.   .dWMMMMMMMMWMMMMMM
MWo.    .xMMMMMMMMMMMMMK;     ;KMNo'.   .:KMMNd.   .lXMMMMMMMMMMMMMMMM
MWo.    .xWMMMMMMMMMMMMK;     ;KMMXk:.   .oNWk'   .:KMMMMMMMMMMMMMMMMM
MWk.    .:XMMMMMMMMMMMWd.    .lNMMMW0,    'k0;.   ,OWMMMMMMMMMMMMMMMMM
MMXc.    .:0WMMMMMMMWXo.     ,OMMMMMWk'   .',.   .xWMMMMMMMMMMMMMMMMMM
MMMKc.    ..cxOKKK0kl,.    .,kWMMMMMMNo.        .oNMMMMMMMMMMMMMMMMMMM
MMMMXd'.     .......     ..c0WMMMMMMMMXc.      .cXMMMMMMMMMMMMMMMMMMMM
MMMMMWKd:..           ..,o0WMMMMMMMMMMM0;.    .;0MMMMMMMMMMMMMMMMMMMMM
MMMMMMMMWKkdl:;,,,;:cox0NWMMMMMMMMMMMMMW0dooooo0WMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMWWNNNWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
" >> /etc/motd

echo "All done! Wait a minute before SSHing. Rebooting..."
echo `reboot`
