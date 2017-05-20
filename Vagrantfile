Vagrant.configure(2) do |config|
  config.vm.box = "joelhandwell/ubuntu_xenial64_vbguest"
  config.vm.provision :shell, path: "install.sh"
  config.vm.provision :shell, path: "startup.sh", run: "always"
  config.vm.network :forwarded_port, host: 9200, guest: 9200
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 1
    v.name = "ES-5.x"
  end
end
