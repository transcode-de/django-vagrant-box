include:
  - ..python

Create glances venv:
  cmd.run:
    - name: python3 -m venv {{ pillar['project']['venvs'] }}/glances
    - runas: {{ pillar['project']['user'] }}
    - unless: ls {{ pillar['project']['venvs'] }}/glances
    - makedirs: True
    - require:
      - Install Python

Install glances:
  cmd.run:
    - name: {{ pillar['project']['venvs'] }}/glances/bin/python -m pip install glances[web]==2.7.1
    - runas: {{ pillar['project']['user'] }}
    - unless: ls {{ pillar['project']['venvs'] }}/glances/bin/glances
    - require:
      - Create glances venv
  file.symlink:
    - name: {{ pillar['project']['home'] }}/bin/glances
    - target: {{ pillar['project']['venvs'] }}/glances/bin/glances
    - user: {{ pillar['project']['user'] }}
    - group: {{ pillar['project']['group'] }}
    - makedirs: True
    - mode: 0775

Start glances service:
  file.managed:
    - name: /etc/systemd/system/glances.service
    - template: jinja
    - source: salt://glances/glances.service
    - require:
      - Install glances
  service.running:
    - name: glances
    - enable: True
    - watch:
        - file: /etc/systemd/system/glances.service
