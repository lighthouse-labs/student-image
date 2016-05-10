Mostly stolen from https://github.com/kaorimatz/packer-templates

gems pre-installed
- rails
- rspec
- nokogiri
- sinatra
- kominari
- pry-byebug

bash profiles

# local testing

- `packer build lighthouse-ubuntu-15.10.json`
- `vagrant up`
- `vagrant ssh`
- `vagrant destroy`
- `vagrant box remove lighthouse-ubuntu-15.10-amd64.box`

# manually testing the salt in the vm

`salt-call --local state.highstate`

- .git_prompt missing
