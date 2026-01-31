# Remnux
sebuah distribusi Linux berbasis Ubuntu yang dirancang khusus untuk analisis malware dan forensik digital. Remnux menyediakan berbagai alat dan utilitas yang memudahkan para analis keamanan dalam mengidentifikasi, menganalisis, dan memahami malware serta ancaman siber lainnya.

- https://remnux.org/
- https://github.com/t-mtsmt/Vagrant-REMnux

## how to setup
### container
- https://docs.remnux.org/run-tools-in-containers/remnux-containers

```bash
docker run --rm -it --entrypoint "/bin/bash" remnux/thug

docker run -it --rm -v ~/workdir:/home/nonroot/workdir remnux/binary-refinery

docker run -d --rm --name jsdetox -p 3000:3000 remnux/jsdetox

docker run --rm -it -v <files_directory>:/home/nonroot/files remnux/rekall bash

docker run -it --rm -v <files_directory>:/tmp/files remnux/retdec bash

docker run --rm -it -v ~/workdir:/home/nonroot/workdir remnux/rizin

docker run --rm -it -v ~/workdir:/home/nonroot/workdir remnux/radare2

docker run -it --rm -v ~/workdir:/home/nonroot/workdir remnux/viper
sudo service clamav-daemon start

docker run -it --rm -v ~/workdir:/home/nonroot/workdir remnux/ciphey -f input.txt
docker run -it --rm remnux/ciphey "=MXazlHbh5WQgUmchdHbh1EIy9mZgQXarx2bvRFI4VnbpxEIBBiO4VnbNVkU"
```

### vagrant
- https://github.com/t-mtsmt/Vagrant-REMnux
- https://portal.cloud.hashicorp.com/vagrant/discover/t-mtsmt/REMnux

```bash
mkdir remnux
cd remnux
```

```
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "t-mtsmt/REMnux"

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
    v.gui = true
  end

  config.vm.provider "vmware_desktop" do |v|
    v.allowlist_verified = true
    v.memory = 4096
    v.cpus = 2
    v.gui = true
  end

end
```

Run Remnux VM
```bash
vagrant up
```
