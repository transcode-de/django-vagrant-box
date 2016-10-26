include:
  - .python

Install development tools:
  pkg.installed:
    - pkgs:
      - ack-grep: 2.14-4
      - cloc: 1.60-1.1
      - curl: 7.47.0-1ubuntu2.1
      - graphviz: 2.38.0-12ubuntu2
      - httpie: 0.9.2-1
      - iftop: 1.0~pre4-3
      - jq: 1.5+dfsg-1
      - screen: 4.3.1-2build1
      - silversearcher-ag: 0.31.0-2
      - tree: 1.7.0-3

Create thefuck venv:
  cmd.run:
    - name: python3 -m venv {{ pillar['project']['venvs'] }}/thefuck
    - runas: {{ pillar['project']['user'] }}
    - unless: ls {{ pillar['project']['venvs'] }}/thefuck
    - makedirs: True
    - require:
      - Install Python

Install thefuck:
  cmd.run:
    - name: {{ pillar['project']['venvs'] }}/thefuck/bin/python -m pip install thefuck==3.11
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
