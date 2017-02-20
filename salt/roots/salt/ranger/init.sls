include:
  - ..python

Create ranger venv:
  cmd.run:
    - name: python3 -m venv {{ pillar['project']['venvs'] }}/ranger
    - runas: {{ pillar['project']['user'] }}
    - unless: ls {{ pillar['project']['venvs'] }}/ranger
    - makedirs: True
    - require:
      - Install python

Create ranger requirements file:
  file.managed:
    - name: /tmp/ranger.pip
    - user: root
    - group: root
    - mode: 0644
    - source: salt://ranger/requirements.pip

Install ranger:
  cmd.run:
    - name: {{ pillar['project']['venvs'] }}/ranger/bin/python -m pip install --requirement /tmp/ranger.pip
    - runas: {{ pillar['project']['user'] }}
    - unless: ls {{ pillar['project']['venvs'] }}/ranger/bin/ranger
    - require:
      - Create ranger venv
  file.symlink:
    - name: {{ pillar['project']['home'] }}/bin/ranger
    - target: {{ pillar['project']['venvs'] }}/ranger/bin/ranger
    - user: {{ pillar['project']['user'] }}
    - group: {{ pillar['project']['group'] }}
    - makedirs: True
    - mode: 0755

Remove ranger requirements file:
  file.absent:
    - name: /tmp/ranger.pip

Install rifle:
  file.symlink:
    - name: {{ pillar['project']['home'] }}/bin/rifle
    - target: {{ pillar['project']['venvs'] }}/ranger/bin/rifle
    - user: {{ pillar['project']['user'] }}
    - group: {{ pillar['project']['group'] }}
    - makedirs: True
    - mode: 0755
    - require:
      - Install ranger

Install ranger dependencies:
  pkg.installed:
    - pkgs:
      - atool: 0.39.0*
      - caca-utils: 0.99.beta19*
      - highlight: 3.18*
      - mediainfo: 0.7.82*
      - poppler-utils: 0.41.0*
      - w3m: 0.5.3*
    - require:
      - Install ranger

Copy ranger config:
  cmd.run:
    - name: ranger --copy-config=scope
    - runas: {{ pillar['project']['user'] }}
    - unless: ls {{ pillar['project']['home'] }}/.config/ranger/scope.sh
    - require:
      - Install ranger

Enable whl preview:
  file.replace:
    - name: {{ pillar['project']['home'] }}/.config/ranger/scope.sh
    - pattern: 'war\|(?!whl)'
    - repl: 'war|whl|'
    - count: 1
    - require:
      - Copy ranger config

Enable img2txt:
  file.replace:
    - name: {{ pillar['project']['home'] }}/.config/ranger/scope.sh
    - pattern: '# img2txt'
    - repl: 'img2txt'
    - count: 1
    - require:
      - Copy ranger config
