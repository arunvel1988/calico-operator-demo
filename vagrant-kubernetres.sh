#!/bin/bash
#create kubernetes cluster using vagrant

echo "check if vagrant is installed"
dpkg-query -s vagrant &> /dev/null

if [ $? -ne 0 ]

	then
		echo "vagrant not installed"
                sudo apt-get update -y
                sudo apt install virtualbox -y

                curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

                sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

                sudo apt-get update -y && sudo apt-get install vagrant -y
                
 		
	else
		echo "installed"
fi

echo "check if git is installed"
dpkg-query -s git &> /dev/null

if [ $? -ne 0 ]

        then
                echo "git not installed"
                sudo apt install git -y
             
        else
                echo "git installed"
fi

echo "clone git code"

git clone https://github.com/arunvel1988/kubernetes-ansible-vagrant/

cd kubernetes-ansible-vagrant
vagrant up



