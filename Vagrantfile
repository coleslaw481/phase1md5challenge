# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "puppetlabs/centos-7.0-64-nocm"
  config.vm.provision :shell, path: "bootstrap.sh"

  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
      vb.customize [ "modifyvm", :id, "--ioapic", "on"]
      # Customize the amount of memory on the VM:
      vb.memory = "2048"
      vb.cpus = "1"
  end
end

