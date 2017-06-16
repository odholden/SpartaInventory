# Install required plugins
required_plugins = ["vagrant-hostsupdater" , "vagrant-berkshelf"]
required_plugins.each do |plugin|
    exec "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

Vagrant.configure("2") do |config|

  config.vm.define "app" do |app|
      app.vm.box = "ubuntu/xenial64"
      app.vm.network "private_network", ip: "192.168.10.100"
      app.hostsupdater.aliases = ["development.local"]
      app.vm.synced_folder ".", "/home/ubuntu/app"
      app.vm.provision "chef_solo" do |chef|
          chef.run_list = ['recipe[rails-server::default]']
      end
  end

  config.vm.define "db" do |db|
    db.vm.box = "ubuntu/xenial64"
    db.vm.network "private_network", ip: "192.168.10.150"
    db.hostsupdater.aliases = ["database.local"]
    db.vm.provision "chef_solo" do |chef|
        chef.run_list = ['recipe[postgres-server::default]']
    end
  end

end
