rvm-deps:
  pkg.installed:
    - pkgs:
      - bash
      - coreutils
      - gzip
      - bzip2
      - gawk
      - sed
      - curl
      - git-core
      - subversion
      - curl

mri-deps:
  pkg.installed:
    - pkgs:
      - build-essential
      - openssl
      - libreadline6
      - libreadline6-dev
      - curl
      - git-core
      - zlib1g
      - zlib1g-dev
      - libssl-dev
      - libyaml-dev
      - libsqlite3-0
      - libsqlite3-dev
      - sqlite3
      - libxml2-dev
      - libxslt1-dev
      - autoconf
      - libc6-dev
      - libncurses5-dev
      - automake
      - libtool
      - bison
      - subversion

rvm:
  cmd:
    - run
    - name: curl -L get.rvm.io | bash -s stable
    - user: vagrant
    - unless: test -s "$HOME/.rvm/scripts/rvm"
    - require:
      - pkg: curl

rvm_bashrc:
  cmd:
    - run
    - name: echo "[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm" >> $HOME/.bashrc
    - user: vagrant
    - unless: grep ".rvm/scripts/rvm" ~/.bashrc
    - require:
      - cmd: rvm

ruby:
  cmd:
    - run
    - name: rvm install 2.1.3 && rvm alias create default 2.1.3
    - user: vagrant
    - unless: test -d $HOME/.rvm/rubies/2.1.3
    - require:
      - cmd: rvm_bashrc

# rvm-key:
#   gpg.receive_key:
#     - keys: '409B6B1796C275462A1703113804BB82D39DC0E3'
#     - user: vagrant
#     - require:
#       - pkg: python-gnupg

# gemset:
#   rvm.gemset_present:
#     - ruby: ruby-2.1.3
