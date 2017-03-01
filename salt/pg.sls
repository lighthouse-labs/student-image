pg_user:
  postgres_user.present:
    - name: {{ pillar['user'] }}
    - superuser: true

pg_user_development:
  postgres_user.present:
    - name: development
    - superuser: true
    - password: development

pg_database:
  postgres_database.present:
    - name: {{ pillar['user'] }}
    - db_user: {{ pillar['user'] }}
    - user: {{ pillar['user'] }}
    - require:
      - postgres_user: pg_user

pg_database_development:
  postgres_database.present:
    - name: development
    - db_user: development
    - user: development
    - require:
      - postgres_user: pg_user_development

/etc/postgresql/9.5/main/pg_hba.conf:
  file.managed:
    - user: postgres
    - group: postgres
    - mode: 640
    - template: jinja
    - source: salt://postgresql/pg_hba.conf

/etc/postgresql/9.5/main/postgresql.conf:
  file.managed:
    - user: postgres
    - group: postgres
    - mode: 640
    - template: jinja
    - source: salt://postgresql/postgresql.conf
