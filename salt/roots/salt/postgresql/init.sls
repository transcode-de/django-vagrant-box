Install PostgreSQL:
  pkg.installed:
    - name: postgresql
    - version: 9.5+173
  service.running:
    - name: postgresql
    - enable: True
    - watch:
        - file: /etc/postgresql/9.5/main/pg_hba.conf
  file.managed:
    - name: /etc/postgresql/9.5/main/pg_hba.conf
    - user: postgres
    - group: postgres
    - mode: 0644
    - source: salt://postgresql/pg_hba.conf
    - template: jinja

Create PostgreSQL user:
  postgres_user.present:
    - name: {{ pillar['db']['username'] }}
    - createdb: True
    - password: {{ pillar['db']['password'] }}
    - user: postgres
    - require:
      - service: postgresql

Create PostgreSQL database:
  postgres_database.present:
    - name: {{ pillar['db']['name'] }}
    - encoding: UTF8
    - lc_ctype: en_US.UTF-8
    - lc_collate: en_US.UTF-8
    - template: template0
    - owner: {{ pillar['db']['username'] }}
    - user: postgres
    - require:
      - postgres_user: {{ pillar['db']['username'] }}
