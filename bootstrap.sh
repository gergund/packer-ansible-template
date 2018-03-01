
/bin/echo  "Configure yum repos ..."
	/usr/bin/sudo yum-config-manager --enable epel
	/usr/bin/sudo yum clean all
/bin/echo  "Done"

/bin/echo "Install ansible for python2.6"
	/usr/bin/sudo yum install -y ansible libselinux-python python2 git && /bin/echo 'Install of ansible and git - done'
/bin/echo "Done"

/bin/echo "Install ansible for pythong2.7"
        /usr/bin/sudo pip install ansible && /bin/echo 'Install of ansible - done'
/bin/echo "Done"

/bin/echo "Run ansible to provision configuration ..."
	/bin/mkdir -p /tmp/ansible_provisioning && cd /tmp/ansible_provisioning
	/usr/bin/git clone https://github.com/gergund/packer-ansible-template.git . 
	/usr/bin/sudo /usr/bin/python27 /usr/bin/ansible-playbook ./ansible/site.yml --connection=local
/bin/echo "Done"
