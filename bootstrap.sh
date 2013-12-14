#!/bin/bash
apt-get install git -y
test -d devstack || \
	sudo -u vagrant git clone git://github.com/openstack-dev/devstack.git 
cd devstack
sudo -u vagrant git checkout stable/grizzly
cat <<EOF > localrc
ADMIN_PASSWORD=password
MYSQL_PASSWORD=password
RABBIT_PASSWORD=password
SERVICE_PASSWORD=password
SERVICE_TOKEN=tokentoken
PUBLIC_INTERFACE=eth0
FLAT_INTERFACE=lo
HOST_IP_IFACE=eth1
EOF

chown -R vagrant .
sudo -u vagrant bash ./stack.sh
