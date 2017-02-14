nvm:
  cmd:
    - run
    - user: {{ pillar['user'] }}
    - shell: /bin/bash
    - unless: test -s "$HOME/.nvm"
    - name: curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.3/install.sh | bash
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
