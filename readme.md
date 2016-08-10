Mostly stolen from https://github.com/kaorimatz/packer-templates

fzero's scripts to be integrated: https://github.com/lighthouse-labs/setup-scripts

gems pre-installed
- rails
- rspec
- nokogiri
- sinatra
- kominari
- pry-byebug

bash profiles

## Local install

TODO - How to run checkout and run salt on a fresh ubuntu install to do the setup without vagrant/vm.

## Head vs Headless

TODO

## Packages

Packages installed are indicated in the pillar/packages.sls

Add new packages as required to the yaml list.

## Gems

Required globally installed gems in the pillar/gems.sls

## NPM

Required globally installed npms in the pillar/npms.sls

# local testing

- `packer build lighthouse-ubuntu-15.10.json`
- `vagrant up`
- `vagrant ssh`
- `vagrant destroy`
- `vagrant box remove lighthouse-ubuntu-15.10-amd64.box`

# manually testing the salt in the vm

`salt-call --local state.highstate`

- .git_prompt missing
