{% if pillar['user'] == 'vagrant' %}
vagrant:
  group.present:
    - addusers:
      - vagrant
  user.present:
    - gid: vagrant
postgres:
  group.present:
    - addusers:
      - vagrant
{% endif %}
