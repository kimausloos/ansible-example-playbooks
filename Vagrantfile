Vagrant.configure(2) do |config|
  config.ssh.forward_agent = true

  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 80,    host: 8080
  config.vm.network "forwarded_port", guest: 8000,  host: 8000
  config.vm.network "private_network", ip: "192.168.33.10"
  
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.cpus = 2
    vb.memory = "2048"
  end
  
  config.vm.provision "ansible" do |ansible|
    ansible.verbose = false
    ansible.playbook = "lemp.yml"

    ansible.extra_vars = {
      hostname: "vagrantsi",
      gitlab_host: "192.168.33.10"
    }
  end
end
