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
    - name: curl -sSL https://rvm.io/mpapis.asc | gpg --import - && curl -L get.rvm.io | bash -s stable
    - user: {{ pillar['user'] }}
    - unless: test -s "$HOME/.rvm/scripts/rvm"
    - require:
      - pkg: rvm-deps

rvm_bashrc:
  cmd:
    - run
    - name: echo "[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm" >> $HOME/.bashrc
    - user: {{ pillar['user'] }}
    - unless: grep ".rvm/scripts/rvm" ~/.bashrc
    - require:
      - cmd: rvm

ruby:
  cmd:
    - run
    - name: rvm install 2.3.0 && rvm alias create default 2.3.0
    - user: {{ pillar['user'] }}
    - unless: test -d $HOME/.rvm/rubies/2.3.0
    - require:
      - cmd: rvm_bashrc
