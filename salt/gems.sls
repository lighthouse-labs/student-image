# Configure gem to not make docs by default
gemrc:
  file.managed:
    - name: "/home/vagrant/.gemrc"
    - user: {{ pillar['user'] }}
    - group: {{ pillar['group'] }}
    - chmod: 664
    - contents: "gem: --no-rdoc --no-ri"

{% for gem in pillar.get('gems', []) %}
{{gem}}:
  gem.installed:
    - user: {{ pillar['user'] }}
    - require:
      - cmd: ruby
      - file: gemrc
{% endfor %}
