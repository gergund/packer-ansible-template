
/bin/echo  "Configure yum repos ..."
	/usr/bin/sudo yum-config-manager --enable epel
	/usr/bin/sudo yum clean all
/bin/echo  "Done"

/bin/echo "Install ansible ..."
	/usr/bin/sudo yum install -y ansible libselinux-python python2 && /bin/echo 'Install of ansible - done'
/bin/echo "Done"

/bin/echo "Run ansible to provision configuration ..."
	/usr/bin/sudo /usr/bin/python27 /usr/bin/ansible-playbook ./ansible/site.yml --connection=local
/bin/echo "Done"
