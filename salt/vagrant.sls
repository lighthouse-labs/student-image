vagrant:
  group.present:
    - addusers:
      - vagrant
  user.present:
    - gid: vagrant
  postgres_user.present:
    - name: vagrant
  postgres_database.present:
    - name: vagrant
  postgres_privileges.present:
    - name: vagrant
