include:
  - ..python

Create glances venv:
  cmd.run:
    - name: python3 -m venv {{ pillar['project']['venvs'] }}/glances
    - runas: {{ pillar['project']['user'] }}
    - unless: ls {{ pillar['project']['venvs'] }}/glances
    - makedirs: True
    - require:
      - Install python

Create glances requirements file:
  file.managed:
    - name: /tmp/glances.pip
    - user: root
    - group: root
    - mode: 0644
    - source: salt://glances/requirements.pip

Install glances:
  cmd.run:
    - name: {{ pillar['project']['venvs'] }}/glances/bin/python -m pip install --requirement /tmp/glances.pip
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
    - mode: 0755

Remove glances requirements file:
  file.absent:
    - name: /tmp/glances.pip

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
