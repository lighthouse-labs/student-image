/home/vagrant/.bashrc:
  file:
    - prepend
    - template: jinja
    - sources:
      - salt://shell/dot_bashrc.template

# Place users in /vagrant by default
/home/vagrant/.profile:
  file.append:
    - text: cd /vagrant

/home/vagrant/.git-prompt.sh:
  file.managed:
    - source: salt://shell/dot_git-prompt.sh.template
    - user: vagrant
    - group: vagrant
    - mode: 644

/home/vagrant/.gitconfig:
  file.managed:
    - source: salt://shell/dot_gitconfig.template
    - user: vagrant
    - group: vagrant
    - mode: 644

/home/vagrant/.git_prompt:
  file.managed:
    - source: salt://shell/dot_gitprompt.template
    - user: vagrant
    - group: vagrant
    - mode: 644
