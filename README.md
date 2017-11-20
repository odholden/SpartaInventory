# README

## Installation

### Install VirtualBox, Vagrant and Chef

The easiest way to get this project running is by using Vagrant. Vagrant starts and controls virtual machines for you using VirtualBox. This project has been setup to create two virtual machines in a 2 tier structure. One for the app and another for the database. It will install all the necessary sofware on both. To use this setup you need to install VirtualBox, Vagrant and Chef for your machine.

[https://www.vagrantup.com/downloads.html](Vagrant)
[https://www.virtualbox.org/wiki/Downloads](VirtualBox)

Chef is most easily installed from the command line:

#### Linux and Mac
```bash
curl -L https://www.chef.io/chef/install.sh | sudo bash
```

#### Windows
Please refer to instructions for the windows platform

#### Starting the machines
Clone the repository to your directory:

```bash
git clone git@github.com:spartaglobal/SpartaInventory.git
cd SpartaInventory
```
Now you can start both machines at the same time using vagrant:

```bash
# This command will start both machines
vagrant up

# You can also start the machines individually if necessary
vagrant up app
vagrant up db
```

Starting the machines may take a few minutes the first time as it downloads required files.

#### Accessing the machines

Vagrant will copy the app files on the virtual machine for you. You can access the machine like this:

```bash
# Log in to the app machine
vagrant ssh app

# ( Optional ) log in to the db machine for working directly with the db
vagrant ssh db
```

Assuming you have logged in to the app machine you will find the app files in the ``/home/ubuntu/app`` directory.

You can now run the following commands to create and seed the database and then to run the app as normal:

```bash
cd app
bundle install
rake db:create
rake db:migrate
rails s
```

You can view the app in your browser at http://development.local:3000

> NOTE : You will likely need the http at the start to prevent the browser from thinking it's a google search

#### Synced files

Vagrant will automatically sync the app files between your machine ( the host ) and the app virtual machine ( the guest ). This means you can continue to work on the files on your machine ( the host ) and changes will be automatically updated to the virtual machine. Be careful as this syncing works in both directions!

#### Shutting down

The virtual machines use your machines resources so it is best to shut them down when you are finished.

You can shut them both down or individually as follows:

```bash
vagrant destroy

# individually
vagrant destroy app
vagrant destroy db
```

When you destroy a virtual machine any changes you've made to the system such as installing ruby gems, or adding data to the database will be lost. 

If you wish to save those changes you can use:

```bash
vagrant suspend
```

This will dump the contents of the virtual machine memory to a file which can be restored later using ```vagrant up```. This will use considerable hard disk space so only use this option if entirely necessary.


## Using the app

The app requires that you log in. You must have a Sparta Identity account to log in to the system. 

Ask and administrator to create a test account for you to use.

## Useful information

The app virtual machine can b


