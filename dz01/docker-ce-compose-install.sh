#/bin/bash
#Vadim.Bykau@silkdata.ai
#Install Docker Engine - Community for Ubuntu 18.04
echo -e "Wellcome to Docker CE & Docker Compose Installation script"

echo -e "Uninstall old versions..."
sudo apt-get remove docker docker-engine docker.io containerd runc

echo "Install Docker Engine - Community using the repository:"
echo "Update the apt package index..."
sudo apt-get update
echo "Install packages to allow apt to use a repository over HTTPS"
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
echo "Add Docker’s official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
echo "Set up the stable repository"
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
echo "Update the apt package index..."
sudo apt-get update
echo "Install the latest version of Docker Engine - Community and containerd..."
sudo apt-get install docker-ce docker-ce-cli containerd.io
echo "Start the Docker daemon"
sudo systemctl start docker

#Once Docker is installed, you need to start the Docker daemon. 
#Most Linux distributions use systemctl to start services. 
#If you do not have systemctl, use the service command.
#
#    systemctl:
#    $ sudo systemctl start docker
#
#    service:
#    $ sudo service docker start

#Install Docker Compose
echo "Download the current stable release of Docker Compose - 1.24.1"
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
echo "Apply executable permissions to the binary..."
sudo chmod +x /usr/local/bin/docker-compose

echo "Test the installation..."
sudo docker-compose --version

#Start test-container "Hello world"
docker run hello-world
docker image ls
docker container ls --all
docker system prune -a -f
