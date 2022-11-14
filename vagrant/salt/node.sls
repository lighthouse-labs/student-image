nvm:
  cmd:
    - run
    - user: {{ pillar['user'] }}
    - shell: /bin/bash
    - unless: test -s "$HOME/.nvm"
    - name: curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh  | bash
    - require:
      - pkg: git
      - pkg: curl

nvm-source:
  cmd:
    - run
    - user: {{ pillar['user'] }}
    - shell: /bin/bash
    - name: source $HOME/.nvm/nvm.sh
    - require:
      - cmd: nvm

node:
  cmd:
    - run
    - user: {{ pillar['user'] }}
    - shell: /bin/bash
    - unless: test -s "$HOME/.nvm/versions/node/v{{ pillar['versions']['node'] }}"
    - name: source $HOME/.nvm/nvm.sh && nvm install v{{ pillar['versions']['node'] }} && nvm alias default v{{ pillar['versions']['node'] }}
    - require:
      - cmd: nvm
      - cmd: nvm-source

node-pre-gyp:
    cmd:
      - run
      - user: {{ pillar['user'] }}
      - shell: /bin/bash
      - name: source $HOME/.nvm/nvm.sh && nvm exec {{ pillar['versions']['node'] }} npm install -g node-pre-gyp
      - require:
        - cmd: node