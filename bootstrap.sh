#!/bin/bash
/bin/echo  "Configure yum repos ..."
	/usr/bin/sudo yum-config-manager --enable epel
	/usr/bin/sudo yum clean all
/bin/echo  "Done"

/bin/echo "Install yum packages"
	/usr/bin/sudo yum install -y git && /bin/echo 'Install yum packages - done'
/bin/echo "Done"

/bin/echo "Install ansible"
        /usr/bin/sudo pip install ansible && /bin/echo 'Install of ansible - done'
/bin/echo "Done"

/bin/echo "Run ansible to provision configuration ..."
	/bin/mkdir -p /tmp/ansible_provisioning && cd /tmp/ansible_provisioning
	/usr/bin/git clone https://github.com/gergund/packer-ansible-template.git . 
	/usr/bin/sudo /usr/local/bin/ansible-playbook ./ansible/site.yml --connection=local
/bin/echo "Done"
