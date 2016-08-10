{% if pillar['user'] == 'vagrant' %}
vagrant:
  group.present:
    - addusers:
      - vagrant
  user.present:
    - gid: vagrant
{% endif %}
