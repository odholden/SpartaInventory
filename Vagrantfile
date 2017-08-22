required_plugins = ["vagrant-hostsupdater"]
required_plugins.each do |plugin|
  exec "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

Vagrant.configure("2") do |config|

  config.vm.define "app" do |app|
    app.vm.box = "ubuntu/xenial64"
    app.vm.network "private_network", ip: "192.168.10.103"
    app.hostsupdater.aliases = ["development.local"]
    app.vm.synced_folder ".", "/home/ubuntu/app"
    app.vm.provision "shell", path: "environment/box_app/provision_app.sh"
    app.vm.provision "shell", inline: "echo 'export DATABASE_HOST=192.168.10.104' >> .bash_profile"
    app.vm.provision "shell", inline: "echo 'export IDENTITY_API_URL=http://identity.spartaglobal.academy' >> .bash_profile"
  end

  config.vm.define "db" do |db|
    db.vm.box = "ubuntu/xenial64"
    db.vm.network "private_network", ip: "192.168.10.104"
    db.hostsupdater.aliases = ["db.local"]
    db.vm.synced_folder "./environment/box_db", "/home/ubuntu/app/environment/box_db"
    db.vm.provision "shell", path: "environment/box_db/provision_db.sh"
  end
end
