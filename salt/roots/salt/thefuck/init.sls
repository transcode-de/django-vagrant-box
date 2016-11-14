include:
  - ..python

Create thefuck venv:
  cmd.run:
    - name: python3 -m venv {{ pillar['project']['venvs'] }}/thefuck
    - runas: {{ pillar['project']['user'] }}
    - unless: ls {{ pillar['project']['venvs'] }}/thefuck
    - makedirs: True
    - require:
      - Install python

Create thefuck requirements file:
  file.managed:
    - name: /tmp/thefuck.pip
    - user: root
    - group: root
    - mode: 0755
    - source: salt://thefuck/requirements.pip

Install thefuck:
  cmd.run:
    - name: {{ pillar['project']['venvs'] }}/thefuck/bin/python -m pip install --requirement /tmp/thefuck.pip
    - runas: {{ pillar['project']['user'] }}
    - unless: ls {{ pillar['project']['venvs'] }}/thefuck/bin/thefuck
    - require:
      - Create thefuck venv
  file.symlink:
    - name: {{ pillar['project']['home'] }}/bin/thefuck
    - target: {{ pillar['project']['venvs'] }}/thefuck/bin/thefuck
    - user: {{ pillar['project']['user'] }}
    - group: {{ pillar['project']['group'] }}
    - makedirs: True
    - mode: 0775

Remove thefuck requirements file:
  file.absent:
    - name: /tmp/thefuck.pip

Extend .bashrc for thefuck:
  file.blockreplace:
    - name: {{ pillar['project']['home'] }}/.bashrc
    - marker_start: "# START managed thefuck configuration -DO-NOT-EDIT-"
    - marker_end: "# END managed thefuck configuration"
    - content: |
        if hash {{ pillar['project']['home'] }}/bin/thefuck 2>/dev/null; then
            eval $({{ pillar['project']['home'] }}/bin/thefuck --alias)
        fi
    - template: jinja
    - append_if_not_found: True
