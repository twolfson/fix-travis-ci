# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Start from closest model to Travis CI
  # http://about.travis-ci.org/docs/user/ci-environment/#CI-environment-OS
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Install test dependencies
  config.vm.provision "shell", path: "test/install.sh"
end
