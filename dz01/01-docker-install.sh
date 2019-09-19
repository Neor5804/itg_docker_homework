#/bin/bash
echo
echo -e "################################################################"
echo -e "#		Web Hosting implementation Script	       #"
echo -e "#		Written By: Vadim Bykau			       #"
echo -e "#		Updated: 19.09.2019			       #"
echo -e "################################################################"

#Install Docker Engine - Community for Ubuntu 18.04
echo Hello $USER && echo
read -r -p "Would you like delete old Docker versions? [Y/n]" -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
        echo && echo -e '\033[31mOld versions will be deleted\033[m' && echo
	sudo apt-get remove docker docker-engine docker.io containerd runc
fi
echo && echo -e '\033[32mInstall Docker Engine - Community using the repository\033[m' && echo
echo -e "Update the apt package index..." && echo
sudo apt-get update
echo -e "Install packages to allow apt to use a repository over HTTPS" && echo
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
echo -e "Add Docker’s official GPG key..." && echo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
echo -e "Set up the stable repository" && echo
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
echo && echo -e "Update the apt package index..." && echo
sudo apt-get update
echo && echo -e '\033[32mInstall the latest version of Docker Engine - Community and containerd...\033[m' && echo
sudo apt-get install docker-ce docker-ce-cli containerd.io
echo && echo "Start the Docker daemon" && echo
sudo systemctl start docker

#Install Docker Compose
echo "Download the current stable release of Docker Compose - 1.24.1" && echo
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
echo && echo "Apply executable permissions to the binary..." && echo
sudo chmod +x /usr/local/bin/docker-compose

#Add user to docker group
echo && echo -e '\033[32mPost-installation step - Manage Docker as a non-root user\033[m' && echo
echo "Create the docker group."
sudo groupadd docker
echo "Add your user to the docker group."
sudo usermod -aG docker $USER
#Test Docker installation
echo && echo -e '\033[32mTest the Docker installation. Get version and etc...\033[m' && echo
sudo docker-compose --version
#Start test-container "Hello world"
sudo docker run hello-world
sudo docker image ls
sudo docker container ls --all
echo "Remove test data"
sudo docker system prune -a -f
echo && echo -e '\033[32mDocker is ready to work!\033[m'
