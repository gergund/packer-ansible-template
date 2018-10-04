#!/bin/bash
/bin/echo  "Configure yum repos"
	/usr/bin/sudo yum-config-manager --enable epel
	/usr/bin/sudo yum clean all
/bin/echo  "YUM repos configuration - done"

/bin/echo "Install yum packages"
	/usr/bin/sudo yum install -y git 
/bin/echo 'Install yum packages - done'

/bin/echo "Install ansible"
        /usr/bin/sudo pip install ansible==2.6.5
/bin/echo 'Install of ansible - done'

/bin/echo "Run ansible to provision configuration"
	/bin/mkdir -p /tmp/ansible_provisioning && cd /tmp/ansible_provisioning
	/usr/bin/git clone https://github.com/gergund/packer-ansible-template.git . 
	/usr/bin/sudo /usr/local/bin/ansible-playbook ./ansible/site.yml --connection=local
/bin/echo 'Provisioning - done'

/bin/echo "Code deployment"
	/bin/bash deploy.sh
/bin/echo "Code deployment - done"
