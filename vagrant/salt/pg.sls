pg_user:
  postgres_user.present:
    - name: {{ pillar['user'] }}
    - superuser: true
    - require:
      - file: /etc/postgresql/10/main/pg_hba.conf

pg_user_development:
  postgres_user.present:
    - name: development
    - superuser: true
    - password: development
    - require:
      - file: /etc/postgresql/10/main/pg_hba.conf

pg_database:
  postgres_database.present:
    - name: {{ pillar['user'] }}
    - db_user: {{ pillar['user'] }}
    - user: {{ pillar['user'] }}
    - require:
      - postgres_user: pg_user
      - pkg: postgresql

pg_database_development:
  postgres_database.present:
    - name: development
    - owner: development
    - user: {{ pillar['user'] }}
    - require:
      - postgres_user: pg_user_development
      - pkg: postgresql

/etc/postgresql/10/main/pg_hba.conf:
  file.managed:
    - user: postgres
    - group: postgres
    - mode: 640
    - template: jinja
    - source: salt://postgresql/pg_hba.conf
    - require:
      - pkg: postgresql

/etc/postgresql/10/main/postgresql.conf:
  file.managed:
    - user: postgres
    - group: postgres
    - mode: 640
    - template: jinja
    - source: salt://postgresql/postgresql.conf
    - require:
      - pkg: postgresql

postgresql-service:
  service.running:
    - name: postgresql
    - enable: True
    - reload: True
    - watch:
      - file: /etc/postgresql/10/main/postgresql.conf
      - file: /etc/postgresql/10/main/pg_hba.conf
    - require:
      - pkg: postgresql
