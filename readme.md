# Student image

A automatically built Vagrant/VirtualBox image for students to take the Lighthouse Labs
Web Fundamentals and Web Immersive program.

## Dependencies

- VirtualBox
- Vagrant
- packer

## Local setup with salt

TODO - How to run checkout and run salt on a fresh ubuntu install to do the setup without vagrant/vm.

## Desktop

A desktop image can be built with `make build-desktop`

## Packages

Packages installed are indicated in the pillar/packages.sls

Add new packages as required to the YAML list.

## Gems

Required globally installed gems in the pillar/gems.sls

## NPM

Required globally installed npms in the pillar/npms.sls

# Local Testing

- Build the image `make build vagrantfile`
- Start and run `vagrant up && vagrant ssh`
- Destroy our instance `vagrant destroy`
- Clean up image (otherwise cached in vagrant/vbox)`make clean`

# manually testing the salt in the vm

`salt-call --local state.highstate`


### Credits

Mostly stolen from https://github.com/kaorimatz/packer-templates
But also stolen from https://github.com/boxcutter/ubuntu
Updates/inspiration from fzero's scripts https://github.com/lighthouse-labs/setup-scripts
