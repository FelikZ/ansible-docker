# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "centos/7"
    config.ssh.insert_key = false
    config.vm.provider "virtualbox" do |v|
        v.memory = 2048
    end

    config.vm.box_check_update = false
	
    config.vm.define "docker1" do |node|
		node.vm.network "private_network", ip: "192.168.10.2"
		node.vm.hostname = "docker1"
		
		node.vm.provision :shell, inline: "cat /vagrant/ssh-key.pub >> .ssh/authorized_keys"

		config.vm.provider :virtualbox do |vb|
			vb.customize ["modifyvm", :id, "--memory", "2048"]
		end
	end

    # config.vm.define "master2" do |node|
	# 	node.vm.network "private_network", ip: "192.168.50.12"
	# 	node.vm.hostname = "master2"
		
	# 	node.vm.provision :shell, inline: "cat /vagrant/ssh-key.pub >> .ssh/authorized_keys"

	# 	config.vm.provider :virtualbox do |vb|
	# 		vb.customize ["modifyvm", :id, "--memory", "1024"]
	# 	end
	# end
end
