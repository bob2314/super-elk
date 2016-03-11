# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # set to false, if you do NOT want to check the correct VirtualBox Guest Additions version when booting this box
  if defined?(VagrantVbguest::Middleware)
    config.vbguest.auto_update = true
  end


    config.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"
    config.vm.box_version = "1.0.1"
    config.vm.hostname = "orderexplorer.dev"

    config.vm.network "private_network", ip: "192.168.56.11"
    # config.hostsupdater.aliases = ["local.orderexplorer.dev", "orderex.dev"]
    # if defined? VagrantPlugins::HostsUpdater
    #   config.hostsupdater.aliases = [ "local.orderexplorer.dev", "local.orderex.dev" ]
    # end

    config.vm.network :forwarded_port, guest: 5601, host: 5601
    config.vm.network :forwarded_port, guest: 9200, host: 9200
    config.vm.network :forwarded_port, guest: 9300, host: 9300

    config.vm.synced_folder "/Users/rbrennan/beachbody/codebase/OrderExplorer", "/var/www/orderexplorer",
              create: true,
              group: "vagrant",
              owner: "www-data",
              mount_options: ["dmode=775,fmode=664"]

    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--cpus", "2", "--memory", "2048"]
    end


  config.vm.provider "vmware_fusion" do |v, override|
     ## the puppetlabs ubuntu 14-04 image might work on vmware, not tested? 
    v.provision "shell", path: 'ubuntu.sh'
    v.box = "phusion/ubuntu-14.04-amd64"
    v.vmx["numvcpus"] = "2"
    v.vmx["memsize"] = "2048"
  end


  config.ssh.private_key_path = [ '~/.vagrant.d/insecure_private_key', '~/.ssh/id_rsa' ]
  config.ssh.forward_agent = true

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "default.pp"
    # puppet.module_path = "modules"
    puppet.options = "--verbose"
    # " --debug"
  end


  config.vm.provision "shell", privileged: false, path: 'setup.sh'
  config.vm.provision "shell", privileged: false, path: 'installs.sh'


  # config.vm.provision "puppet",  manifest_file: "default.pp"
end