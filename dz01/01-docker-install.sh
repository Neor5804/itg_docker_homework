#/bin/bash
echo
echo -e "################################################################"
echo -e "#		Web Hosting implementation Script	       #"
echo -e "#		Written By: Vadim Bykau			       #"
echo -e "#		Updated: 19.09.2019			       #"
echo -e "################################################################"

#Uninstall old Docker
echo Hello $USER && echo
read -r -p "Would you like delete old Docker versions? [Y/n] " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
        echo && echo -e '\033[31mOld docker versions will be deleted\033[m' && echo
	sudo apt-get remove docker docker-engine docker.io containerd runc
fi

#Install Docker Engine - Community for Ubuntu 18.04

read -r -p "Install a new version of Docker Engine? [Y/n] " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
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
fi



#Install Docker Compose
read -r -p "Install the current stable release of Docker Compose? [Y/n] " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "Download the current stable release of Docker Compose - 1.24.1" && echo
	sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	echo && echo "Apply executable permissions to the binary..." && echo
	sudo chmod +x /usr/local/bin/docker-compose
	docker-compose --version
fi

#Add user to docker group
read -r -p "Add $USER to docker group? [Y/n] " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo && echo -e '\033[32mPost-installation step - Manage Docker as a non-root user\033[m' && echo
	echo "Add your user to the docker group."
	sudo usermod -aG docker $USER
	echo "$USER is now in docker group"
	id
	echo && echo -e '\033[31mATTENTION!you need to re login to use docker as an unprivileged user!!!\033[m' && echo
fi

#Test Docker installation
echo && echo -e '\033[32mTest the Docker installation. Get version and etc...\033[m' && echo

#Start test-container "Hello world"
echo "Login to user $USER with updated permissions"
su - $USER -c "id && docker run hello-world &&\
docker image ls &&\
docker container ls --all &&\
echo Remove test data &&\
docker system prune -a -f"
id
echo && echo -e '\033[32mDocker is ready to work!\033[m'




#Start docker-compose

