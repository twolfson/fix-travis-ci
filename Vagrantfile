# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Start from closest model to Travis CI
  # http://about.travis-ci.org/docs/user/ci-environment/#CI-environment-OS
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Install test dependencies
  config.vm.provision "shell", inline: $install_test_deps

  # Install `n`, `node@0.8`, and `node@0.10`
  $install_node_version = <<SCRIPT
      sudo npm install -g n
end
