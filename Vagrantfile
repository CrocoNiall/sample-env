Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.provision "shell", path: "provision.sh"
  config.vm.provision "shell", path: "production.sh"

  config.vm.synced_folder "../app", "/home/ubuntu/app"
  config.vm.synced_folder ".", "/home/ubuntu/env"

  config.vm.network "private_network", ip: "192.168.10.100"
  config.hostsupdater.aliases = ["development.local"]


 
end