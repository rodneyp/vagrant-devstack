vagrant-devstack
================

Start a [devstack](http://devstack.org/) instance in a [vagrant](http://www.vagrantup.com/) virtual machine:

    $ vagrant up

User admin, password password.


[Horizon](https://github.com/openstack/horizon/) will be port forwarded:

    $ open http://127.0.0.1:8000/

Login to the machine:

    $ vagrant ssh

Note the localrc content.  Also, the git branch is stable/grizzly which sets the scripts back in time a bit and makes the branches of all the components match the ones in the stable grizzly release.

```
ADMIN_PASSWORD=password
MYSQL_PASSWORD=password
RABBIT_PASSWORD=password
SERVICE_PASSWORD=password
SERVICE_TOKEN=tokentoken
PUBLIC_INTERFACE=eth1
FLAT_INTERFACE=lo
```

# Devstack versions
This will build any of the branches of devstack.  It will checkout the branch before running the devstack setup script.




