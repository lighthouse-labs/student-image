/etc/update-motd.d/05-lighthouse:
  file.managed:
    - mode: 755
    - template: jinja
    - source: salt://motd/lighthouse
