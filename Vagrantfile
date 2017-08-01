# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "pgrunwald/elixir-phoenix-ubuntu-trusty64"
    config.vm.network "forwarded_port", guest: 4000, host: 4000, host_ip: "127.0.0.1"

    config.vm.provision "shell", inline: <<-SHELL
        apt-get update && apt-get install -y git elixir
    SHELL
end
