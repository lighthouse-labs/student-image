gemrc:
  file.managed:
    - name: "/home/vagrant/.gemrc"
    - user: vagrant
    - group: vagrant
    - chmod: 664
    - contents: "gem: --no-rdoc --no-ri"

rails:
  gem.installed:
    - user: vagrant
    - require:
      - cmd: ruby
      - file: gemrc

rspec:
  gem.installed:
    - user: vagrant
    - require:
      - cmd: ruby
      - file: gemrc

nokogiri:
  gem.installed:
    - user: vagrant
    - require:
      - cmd: ruby
      - file: gemrc

sinatra:
  gem.installed:
    - user: vagrant
    - require:
      - cmd: ruby
      - file: gemrc

kaminari:
  gem.installed:
    - user: vagrant
    - require:
      - cmd: ruby
      - file: gemrc

pry-byebug:
  gem.installed:
    - user: vagrant
    - require:
      - cmd: ruby
      - file: gemrc
