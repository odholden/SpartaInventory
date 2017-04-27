# Install required plugins
required_plugins = ["vagrant-hostsupdater" , "vagrant-berkshelf"]
required_plugins.each do |plugin|
    exec "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

Vagrant.configure("2") do |config|

  config.vm.define "rails" do |rails|
      rails.vm.box = "ubuntu/xenial64"
      rails.vm.network "private_network", ip: "192.168.10.100"
      rails.hostsupdater.aliases = ["development.local"]
      rails.vm.synced_folder "../app", "/home/ubuntu/app"
      rails.vm.provision "chef_solo" do |chef|
          chef.cookbooks_path = ['cookbooks']
          chef.run_list = ['recipe[rails-server::default]']
      end
  end

  config.vm.define "db" do |db|
    db.vm.box = "ubuntu/trusty64"
    db.vm.network "private_network", ip: "192.168.10.150"
    db.hostsupdater.aliases = ["database.local"]
    db.vm.provision "chef_solo" do |chef|
        chef.cookbooks_path = ['cookbooks']
        chef.run_list = ['recipe[postgresql-server::default]']
    end
  end

end
