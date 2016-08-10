.PHONEY: reset clean up

build:
	packer build -only=virtualbox-iso lighthouse-ubuntu-16.04-amd64.json

build-docker:
	packer build -only=docker lighthouse-ubuntu-16.04-amd64.json

clean:
	rm ubuntu-16.04-amd64-virtualbox.box || /usr/bin/true
	@vagrant box remove ubuntu-16.04-amd64-virtualbox.box || /usr/bin/true

up:
	vagrant box add lighthouse-ubuntu-15.10-amd64 ./lighthouse-ubuntu-15.10-amd64.box

reset: clean build
