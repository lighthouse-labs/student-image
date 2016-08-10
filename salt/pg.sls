  pg_user:
    postgres_user.present:
      - name: {{ pillar['user'] }}
      - superuser: true
  pg_database:
    postgres_database.present:
      - name: {{ pillar['user'] }}
      - db_user: {{ pillar['user'] }}
      - user: {{ pillar['user'] }}
      - require:
        - postgres_user: pg_user
  
