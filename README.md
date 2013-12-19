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



ptop Devstack with Vagrant
I've been getting into openstack development on cinder lately.  The best way to do this is with a devstack instance on your laptop.  That way, you can code and test without the network wherever you happen to have time.

Setting up the devstack is a great topic to share with a blog posting.  I'll describe the current environment installing an older version of openstack instead of trunk.

This environment is in December 2013.  I'm sure the versions of the various parts will drift over time, so I'll list them all here.

   * laptop: MacBook Air running OSX 10.9
   * VirtualBox 4.3.4
   * Vagrant
   * Devstack: master, except grizzly cinder

## Installation of Code
First, install the programs for VirtualBox and Vagrant.

### Virtualbox

* http://download.virtualbox.org/virtualbox/4.3.6/VirtualBox-4.3.6-91406-OSX.dmg  113MB
* https://www.virtualbox.org/wiki/Downloads

### Vagrant

* http://www.vagrantup.com/downloads.html
* https://dl.bintray.com/mitchellh/vagrant/Vagrant-1.4.1.dmg   34MB


### XCode


If you're running Mac OS X, you must also install Xcode. Users running Lion can can install Xcode through the App Store. You can also grab the installer from http://developer.apple.com/xcode/.

## Get the vagrant definitions
My bootstrap script is in github.  You will need to clone it to your laptop to get started.

## Build the vm
```
% cd vagrant-devstack
% vagrant up
```

This will take a few minutes to run while it downloads and installs the code.  After ten minutes or so depending on machine and network speed, you will have a devstack instance running.

Sometimes while it runs, it's hard to tell if anything is still happening.  There is a long pause while it installs rabbitmq, for example.  It is running, but during the pause it looks like it scans some files to test if they exist and this takes quite awhile.  Eventually the download and install will continue after rabbitmq and it will install mysql and the other packages.

## Issues and Bugs
When booting the devstack, I can connect to horizon and launch a vm but I can't ping the vm from the devstack box.  It should ping at 10.0.0.2 but it does not.

## Using found code
Found this helpful example on github.

    LM-SJN-00871130:~ ropeck$ git clone https://github.com/lorin/devstack-vm.git
    Cloning into 'devstack-vm'...
    remote: Counting objects: 229, done.
    remote: Compressing objects: 100% (96/96), done.
    remote: Total 229 (delta 123), reused 220 (delta 118)
    Receiving objects: 100% (229/229), 50.86 KiB | 0 bytes/s, done.
    Resolving deltas: 100% (123/123), done.
    Checking connectivity... done
    LM-SJN-00871130:~ ropeck$ cd devstack-vm/

But as with a lot of stuff on the net, this did not work.  The code gets this error:

    The executable 'ansible-playbook' Vagrant is trying to run was not found in the PATH variable

But it really is there. I've even installed ansible to be sure, but vagrant still fails to bring up the box.  Here, I show the file is in the right place, and the PATH is correct too.


    [default] Running provisioner: shell...
    [default] Running: inline script
    stdin: is not a tty
    /usr/bin/ansible-playbook
    [default] Running provisioner: ansible...
    The executable 'ansible-playbook' Vagrant is trying to run was not
    found in the PATH variable. This is an error. Please verify
    this software is installed and on the path.

here is the Vagrant file section which runs this above:

    config.vm.provision :shell, :inline => "apt-get update; apt-get install -y ansible"
    config.vm.provision :shell, :inline => "which ansible-playbook"
    config.vm.provision :ansible do |ansible|
        ansible.host_key_checking = false
        ansible.playbook = "devstack.yaml"
        ansible.verbose = "v"
    end

It's frustrating that this did not work.  It seems like a great solution but it can't install the packages.  Maybe the ansible part can be rewritten as a shell script since it's so simple.

## Helpful Links
Some articles and websites with related information:

   * vagrant http://www.vagrantup.com/
   * VirtualBox 4.3.4 https://WW1w.virtualbox.org/wiki/Downloads
   * http://lorinhochstein.wordpress.com/2013/08/17/automated-devstack-install-inside-of-virtualbox-with-vagrant/
   * https://github.com/lorin/devstack-vm
   * http://www.hpcloud.com/blog/installing-devstack-vagrant
   * https://ask.openstack.org/en/question/256/which-network-configuration-for-openstack-in-a-virtualbox/
   * http://www.slideshare.net/lorinh/vagrant-ansible-and-openstack-on-your-laptop
   * http://docs.openstack.org/trunk/training-guides/content/lab000-virtualbox-basics.html
   * https://gist.github.com/andyhky/2654369
   * http://virtualandy.wordpress.com/2012/05/10/getting-started-with-vagrant/
   * http://taoofmac.com/space/HOWTO/Vagrant
   * http://www.jedi.be/blog/2011/11/04/vagrant-virtualbox-hostonly-pxe-vlans/
   * http://www.cloudsoftcorp.com/blog/2013/05/getting-started-with-heat-devstack-vagrant/
   * http://anteaya.info/blog/2013/09/01/installing-devstack-with-vagrant/
   * https://github.com/bcwaldon/vagrant_devstack
   * https://github.com/fnichol/devstack-vagrant-basebox
   
   
   
    
