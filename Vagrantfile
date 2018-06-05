# -*- mode: ruby -*-
# vi: set ft=ruby :
#
####

require 'yaml'

current_dir = File.dirname(File.expand_path(__FILE__))
cfg = YAML.load_file("#{current_dir}/vagrant/vagrantcfg.yml")

VAGRANTFILE_API_VERSION = "2"

CFG_KEY = "config"


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "bento/centos-7.2"
  config.vm.box_url = "https://app.vagrantup.com/bento/boxes/centos-7.2/versions/2.3.1/providers/virtualbox.box"

  config.vm.network "forwarded_port", guest: 3306, host: cfg[CFG_KEY]['forwarded_port']

  config.vm.synced_folder "vagrant", "/vagrant"
  
  config.vm.provider "virtualbox" do |v|
    v.name = cfg[CFG_KEY]['name']
    v.memory = cfg[CFG_KEY]['memory']
    v.cpus = cfg[CFG_KEY]['cpu']
  end

  if Vagrant::Util::Platform.windows?
    config.vm.provision "shell", path: "vagrant/provision.sh"
  else
    config.vm.provision :ansible do |ansible|
      ansible.playbook = "vagrant/playbook.yml"
      # Uncomment following line to enable Ansible debug output
      # ansible.raw_arguments = ["-vvvv"]
    end
  end

end

