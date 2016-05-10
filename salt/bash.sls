/home/vagrant/.bashrc:
  file.managed:
    - source: salt://shell/dot_bashrc.template
    - user: vagrant
    - group: vagrant
    - mode: 644

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
