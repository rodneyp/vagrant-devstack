devstack_version = "grizzly"

Vagrant.configure("1") do |config|
#  config.vm.boot_mode = :gui
end

Vagrant.configure("2") do |cfg|
  cfg.vm.define devstack_version do |config|
    config.vm.box = "precise64"
    config.vm.box = devstack_version+"-hybrid"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"

    config.vm.hostname = config.vm.box

  # interfaces
    config.vm.network "private_network", type: :dhcp

  # horizon
  #  config.vm.network :forwarded_port, host: 8000, guest: 80, auto_correct: true
  # console vnc
  #  config.vm.network :forwarded_port, host: 6080, guest: 6080, auto_correct: true


    config.vm.provision :shell, :path => "bootstrap.sh", :args => devstack_version
  
    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
    end
  end
end
