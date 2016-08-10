nvm:
  cmd:
    - run
    - user: vagrant
    - shell: /bin/bash
    - unless: test -s "$HOME/.nvm"
    - name: curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.3/install.sh | bash
    - require:
      - pkg: git
      - pkg: curl

nvm-source:
  cmd:
    - run
    - user: vagrant
    - shell: /bin/bash
    - name: source $HOME/.nvm/nvm.sh
    - require:
      - cmd: nvm

node:
  cmd:
    - run
    - user: vagrant
    - shell: /bin/bash
    - unless: test -s "$HOME/.nvm/versions/node/v6.3.1"
    - name: source $HOME/.nvm/nvm.sh && nvm install v6.3.1 && nvm alias default v6.3.1
    - require:
      - cmd: nvm
      - cmd: nvm-source
