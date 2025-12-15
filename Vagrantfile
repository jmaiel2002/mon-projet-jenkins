# -*- mode: ruby -*-
# vi: set ft=ruby :

# Toutes les configurations Vagrant se font dans ce bloc
Vagrant.configure("2") do |config|

  # Nom de la box (système d’exploitation de base)
  config.vm.box = "ubuntu/focal64"

  # Nom visible dans VirtualBox
  config.vm.hostname = "ubuntu-vagrant"

  # Configuration réseau (optionnel)
  config.vm.network "private_network", ip: "192.168.56.10"
  config.vm.network "forwarded_port", guest: 8080, host: 9000

  # Configuration spécifique au provider VirtualBox
  config.vm.provider "virtualbox" do |vb|
    vb.name = "Ubuntu-Eya-2025-11-11"
    vb.memory = 8192     # 4 Go RAM (obligatoire pour Minikube)
    vb.cpus = 4           # 4 CPU
    vb.customize ["modifyvm", :id, "--nested-hw-virt", "on"]
  end

  # Synchronisation du dossier (facultatif)
  config.vm.synced_folder ".", "/vagrant"

  # Exemple de provisionnement (désactivé ici)
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
config.vm.boot_timeout = 600
end
