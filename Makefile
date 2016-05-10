.PHONEY: reset clean up

build:
	packer build lighthouse-ubuntu-15.10.json

clean:
	rm lighthouse-ubuntu-15.10-amd64.box || /usr/bin/true
	@vagrant box remove lighthouse-ubuntu-15.10-amd64.box || /usr/bin/true

up:
	vagrant box add lighthouse-ubuntu-15.10-amd64 ./lighthouse-ubuntu-15.10-amd64.box

reset: clean build
