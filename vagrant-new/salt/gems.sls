# Configure gem to not make docs by default
gemrc:
  file.managed:
    - name: "/home/vagrant/.gemrc"
    - user: {{ pillar['user'] }}
    - group: {{ pillar['group'] }}
    - chmod: 664
    - contents: "gem: --no-document"

#{% for gem in pillar.get('gems', []) %}
#{{gem}}:
#  gem.installed:
#    - user: {{ pillar['user'] }}
#    - require:
#      - cmd: ruby
#      - file: gemrc
#{% endfor %}

rails:
  gem.installed:
    - user: {{ pillar['user'] }}
    - version: 6.1.5
    - require:
      - cmd: ruby
      - file: gemrc

rspec:
  gem.installed:
    - user: {{ pillar['user'] }}
    - require:
      - cmd: ruby
      - file: gemrc

nokogiri:
  gem.installed:
    - user: {{ pillar['user'] }}
    - require:
      - cmd: ruby
      - file: gemrc

sinatra:
  gem.installed:
    - user: {{ pillar['user'] }}
    - require:
      - cmd: ruby
      - file: gemrc

kaminari:
  gem.installed:
    - user: {{ pillar['user'] }}
    - require:
      - cmd: ruby
      - file: gemrc

pry-byebug:
  gem.installed:
    - user: {{ pillar['user'] }}
    - require:
      - cmd: ruby
      - file: gemrc

bundler:
  gem.installed:
    - user: {{ pillar['user'] }}
    - require:
      - cmd: ruby
      - file: gemrc
