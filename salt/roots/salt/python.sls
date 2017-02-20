Install python:
  pkg.installed:
    - pkgs:
      - python3.5: 3.5.2*
      - python3.5-dev: 3.5.2*
      - python3.5-venv: 3.5.2*
      - python3-pip: 8.1.1*

Create django venv:
  cmd.run:
    - name: python3 -m venv {{ pillar['project']['venvs'] }}/django
    - runas: {{ pillar['project']['user'] }}
    - unless: ls {{ pillar['project']['venvs'] }}/django
    - makedirs: True

Extend .bashrc for python:
  file.blockreplace:
    - name: {{ pillar['project']['home'] }}/.bashrc
    - marker_start: "# START managed python configuration -DO-NOT-EDIT-"
    - marker_end: "# END managed python configuration"
    - content: |
        if [ -f {{ pillar['project']['venvs'] }}/django/bin/activate ]; then
          source {{ pillar['project']['venvs'] }}/django/bin/activate
        fi
    - template: jinja
    - append_if_not_found: True
