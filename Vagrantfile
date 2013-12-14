local_box = true


Vagrant.configure("1") do |config|
#  config.vm.boot_mode = :gui
end

Vagrant.configure("2") do |cfg|
  cfg.vm.define "devstack-havana" do |config|
    if local_box
      config.vm.box = "devstack"
  #    config.vm.box = "grizzly"
    else 
      config.vm.box = "precise64"
      config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    end

  config.vm.hostname = "devstack-havana"

  # interfaces
  config.vm.network "private_network", type: :dhcp

  # horizon
  config.vm.network :forwarded_port, host: 8000, guest: 80, auto_correct: true
  # console vnc
  config.vm.network :forwarded_port, host: 6080, guest: 6080, auto_correct: true

  # keystone
  #config.vm.network :forwarded_port, host: 5000, guest: 5000, auto_correct: true
  #config.vm.network :forwarded_port, host: 35357, guest: 35357, auto_correct: true

  config.vm.provision :shell, :path => "bootstrap.sh"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end
  end
end
