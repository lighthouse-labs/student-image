vagrant:
  group.present:
    - addusers:
      - vagrant
  user.present:
    - gid: vagrant
