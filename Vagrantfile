Vagrant.configure(2) do |config|
  config.vm.box = "boxcutter/ubuntu1604"
  config.vm.box_version = "2.0.20"

  # Enable agent forwarding over SSH connections
  config.ssh.forward_agent = true

  # Port forwarding for Django's development server.
  config.vm.network "forwarded_port", guest: 8000, host: 8000,
    auto_correct: true

  # Port forwarding for Glances server.
  config.vm.network "forwarded_port", guest: 61208, host: 61208,
    auto_correct: true

  # Salt provisioning.
  config.vm.synced_folder "salt/roots/", "/srv/"
  config.vm.provision :salt do |salt|
    salt.masterless = true
    salt.minion_config = "salt/minion"
    salt.run_highstate = true
  end
end
