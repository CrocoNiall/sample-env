Vagrant.configure("2") do |config|
  required_plugins = ["vagrant-hostsupdater", "vagrant-berkshelf"]
  required_plugins.each do |plugin|
      exec "vagrant plugin install #{plugin};vagrant #{ARGV.join(" ")}" unless Vagrant.has_plugin? plugin || ARGV[0] == 'plugin'
  end


  config.vm.box = "ubuntu/trusty64"

  # config.vm.provision "shell", path: "provision.sh"
  # config.vm.provision "shell", path: "production.sh"

  config.vm.provision "chef_solo" do |chef| 
    chef.cookbooks_path = ['cookbooks']
    chef.run_list = ['recipe[node-server::default]']
  end
  config.vm.synced_folder "../app", "/home/ubuntu/app"
  config.vm.synced_folder ".", "/home/ubuntu/env"

  config.vm.network "private_network", ip: "192.168.10.100"
  config.hostsupdater.aliases = ["development.local"]


 
end