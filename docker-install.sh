# install docker-ce on ubuntu 20.04
set -ex

# curl -L https://gist.githubusercontent.com/hellt/e8095c1719a3ea0051165ff282d2b62a/raw/1dffb71d0495bb2be953c489cd06a25656d974a4/docker-install.sh | sudo bash

# Uninstall old versions
# Older versions of Docker went by the names of docker, docker.io, or docker-engine. 
# Uninstall any such older versions before attempting to install a new version:
sudo apt-get remove docker docker-engine docker.io containerd runc

# Update the apt package index and install packages to allow 
# apt to use a repository over HTTPS:
sudo apt-get update

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Use the following command to set up the repository:
sudo add-apt-repository \
   "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
