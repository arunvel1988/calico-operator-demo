#!/bin/bash
#create kubernetes cluster using  multipass
set +x
echo "********************check if multipass is installed***************************"
multipass &> /dev/null

if [ $? -ne 0 ]

	then
		echo "*****************multipass not installed********************"
                sudo snap install multipass
                sudo snap info multipass
                
 		
	else
		echo "************installed multipass*****************"
fi

echo "******************check if git is installed**********************"
dpkg-query -s git &> /dev/null

if [ $? -ne 0 ]

        then
                echo "****************git not installed*****************"
                sudo apt install git -y
             
        else
                echo "git installed"
fi

echo "**************clone git code ************************"



git clone https://github.com/arunvel1988/calico-operator-demo

cd calico-operator-demo

curl https://raw.githubusercontent.com/arunvel1988/ccol1/main/control-init.yaml | multipass launch -n control -m 2048M 20.04 --cloud-init -

if [ $? -ne 0 ]
	then
		echo "host alredy exists"
 		sudo multipass start --all
                sudo multipass list
                #sudo systemctl status snap.multipass.multipassd.service 

	else
		echo "launching host1"
fi

#curl https://raw.githubusercontent.com/arunvel1988/ccol1/main/node1-init.yaml | multipass launch -n node1 20.04 --cloud-init -

#curl https://raw.githubusercontent.com/arunvel1988/ccol1/main/node2-init.yaml | multipass launch -n node2 20.04 --cloud-init -

#curl https://raw.githubusercontent.com/arunvel1988/ccol1/main/host1-init.yaml | multipass launch -n host1 20.04 --cloud-init -



multipass shell host1

kubectl get nodes
