rails:
  gem.installed:
    - user: vagrant
    - require:
      - cmd: ruby

rspec:
  gem.installed:
    - user: vagrant
    - require:
      - cmd: ruby

nokogiri:
  gem.installed:
    - user: vagrant
    - require:
      - cmd: ruby

sinatra:
  gem.installed:
    - user: vagrant
    - require:
      - cmd: ruby

kaminari:
  gem.installed:
    - user: vagrant
    - require:
      - cmd: ruby

pry-byebug:
  gem.installed:
    - user: vagrant
    - require:
      - cmd: ruby
