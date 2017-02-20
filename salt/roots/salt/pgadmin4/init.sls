include:
  - ..python

Create pgadmin4 venv:
  cmd.run:
    - name: python3 -m venv {{ pillar['project']['venvs'] }}/pgadmin4
    - runas: {{ pillar['project']['user'] }}
    - unless: ls {{ pillar['project']['venvs'] }}/pgadmin4
    - makedirs: True
    - require:
      - Install python

Create pgadmin4 requirements file:
  file.managed:
    - name: /tmp/pgadmin4.pip
    - user: root
    - group: root
    - mode: 0644
    - source: salt://pgadmin4/requirements.pip

Install pgadmin4:
  cmd.run:
    - name: {{ pillar['project']['venvs'] }}/pgadmin4/bin/python -m pip install --requirement /tmp/pgadmin4.pip
    - runas: {{ pillar['project']['user'] }}
    - unless: ls {{ pillar['project']['venvs'] }}/pgadmin4/lib/python3.5/site-packages/pgadmin4/pgAdmin4.py
    - require:
      - Create pgadmin4 venv
  file.managed:
    - name: {{ pillar['project']['home'] }}/bin/pgadmin4
    - user: {{ pillar['project']['user'] }}
    - group: {{ pillar['project']['group'] }}
    - mode: 0755
    - contents: |
        {{ pillar['project']['venvs'] }}/pgadmin4/bin/python {{ pillar['project']['venvs'] }}/pgadmin4/lib/python3.5/site-packages/pgadmin4/pgAdmin4.py

Remove pgadmin4 requirements file:
  file.absent:
    - name: /tmp/pgadmin4.pip

Configure pgadmin4:
  file.managed:
    - name: {{ pillar['project']['venvs'] }}/pgadmin4/lib/python3.5/site-packages/pgadmin4/config_local.py
    - user: {{ pillar['project']['user'] }}
    - group: {{ pillar['project']['group'] }}
    - mode: 0644
    - contents: |
        DEFAULT_SERVER = '0.0.0.0'
        SERVER_MODE = False
    - require:
      - Install pgadmin4
