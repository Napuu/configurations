Vagrant.configure("2") do |config|
    config.vm.box = "debian/buster64"
    config.vm.hostname = "devbox"
    config.vm.provider "virtualbox" do |v|
        v.memory = 8196
        v.cpus = 6
        v.gui = true
    end

    config.vbguest.auto_update = false
    
    # do NOT download the iso file from a webserver
    config.vbguest.no_remote = true
    #config.vm.network :private_network, ip: "192.168.0.42"
    config.vm.provision "playbook1", type:"ansible_local" do |ansible|
        ansible.playbook = "playbook_root.yml"
    end
    config.vm.provision "playbook2", type:"ansible_local" do |ansible|
        ansible.playbook = "playbook_nonroot.yml"
    end
end
