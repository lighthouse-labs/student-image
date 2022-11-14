/home/{{ pillar['user'] }}/.bashrc:
  file:
    - prepend
    - template: jinja
    - sources:
      - salt://shell/dot_bashrc.template

# Place users in /vagrant by default
{% if pillar['user'] == 'vagrant' %}
/home/{{ pillar['user'] }}/.profile:
  file.append:
    - text: cd /vagrant
{% endif %}

/home/{{ pillar['user'] }}/.git-prompt.sh:
  file.managed:
    - source: salt://shell/dot_git-prompt.sh.template
    - user: {{ pillar['user'] }}
    - group: {{ pillar['user'] }}
    - mode: 644

/home/{{ pillar['user'] }}/.gitconfig:
  file.managed:
    - source: salt://shell/dot_gitconfig.template
    - user: {{ pillar['user'] }}
    - group: {{ pillar['user'] }}
    - mode: 644

/home/{{ pillar['user'] }}/.git_prompt:
  file.managed:
    - source: salt://shell/dot_gitprompt.template
    - user: {{ pillar['user'] }}
    - group: {{ pillar['user'] }}
    - mode: 644
