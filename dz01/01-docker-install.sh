#/bin/bash
echo
echo -e "################################################################"
echo -e "#		Web Hosting implementation Script	       #"
echo -e "#		Written By: Vadim Bykau			       #"
echo -e "#		Updated: 19.09.2019			       #"
echo -e "################################################################"
#
#Install Docker Engine - Community for Ubuntu 18.04
echo
read -r -p "Delete old Docker versions? [Y/n]" -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
        echo -e "Old versions will be deleted"
	sudo apt-get remove docker docker-engine docker.io containerd runc
fi
echo
echo -e "Install Docker Engine - Community using the repository:"
echo -e "Update the apt package index..."
sudo apt-get update
echo -e "Install packages to allow apt to use a repository over HTTPS"
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
echo -e "Add Docker’s official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
echo -e "Set up the stable repository"
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
echo -e "Update the apt package index..."
sudo apt-get update
echo "Install the latest version of Docker Engine - Community and containerd..."
sudo apt-get install docker-ce docker-ce-cli containerd.io
echo "Start the Docker daemon"
sudo systemctl start docker
sleep 3
#Install Docker Compose
echo "Download the current stable release of Docker Compose - 1.24.1"
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
echo "Apply executable permissions to the binary..."
sudo chmod +x /usr/local/bin/docker-compose
sleep 3
#Post-installation step - Manage Docker as a non-root user
echo "Create the docker group."
sudo groupadd docker
echo "Add your user to the docker group."
sudo usermod -aG docker $USER
sudo newgrp docker

#Test Docker installation
echo "Test the Docker installation. Get version and etc..."
docker-compose --version
#Start test-container "Hello world"
docker run hello-world
docker image ls
docker container ls --all
echo "Remove test data"
docker system prune -a -f
echo "Docker is ready to work!"
