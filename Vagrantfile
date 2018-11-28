# -*- mode: ruby -*-
# vi: set ft=ruby :
$script = <<SCRIPT

echo Installing depedencies...
sudo apt-get install -y unzip wget

echo Fetching Serf...
cd /tmp/
wget https://releases.hashicorp.com/serf/0.8.1/serf_0.8.1_linux_amd64.zip -O serf.zip

echo Installing Serf...
unzip serf.zip
sudo chmod +x serf
sudo mv serf /usr/bin/serf

SCRIPT

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "bento/ubuntu-18.04"

  config.vm.provision "shell", inline: $script
  config.vm.provision "file", source: "./event.cmd.sh", destination: "/home/vagrant/event.cmd.sh"

  config.vm.define "n1" do |n1|
      n1.vm.network "private_network", ip: "172.20.20.10"
      n1.vm.hostname = "n1"
  end

  config.vm.define "n2" do |n2|
      n2.vm.network "private_network", ip: "172.20.20.11"
      n2.vm.hostname = "n2"
  end
end
