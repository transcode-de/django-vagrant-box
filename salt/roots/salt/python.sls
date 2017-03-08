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

Clone pyenv repository:
  git.latest:
    - name: https://github.com/pyenv/pyenv.git
    - rev: v1.0.8
    - target: {{ pillar['project']['home'] }}/.pyenv
    - user: {{ pillar['project']['user'] }}

python-3.6.0:
  pyenv.installed:
    - user: {{ pillar['project']['user'] }}
    - require:
      - Clone pyenv repository

Extend .bashrc for python:
  file.blockreplace:
    - name: {{ pillar['project']['home'] }}/.bashrc
    - marker_start: "# START managed python and pyenv configuration -DO-NOT-EDIT-"
    - marker_end: "# END managed python and pyenv configuration"
    - content: |
        eval "$(pip completion --bash --disable-pip-version-check)"
        export PYENV_ROOT="${HOME}/.pyenv"
        export PATH="${PYENV_ROOT}/bin:${PATH}"
        eval "$(pyenv init -)"
        [ -f "{{ pillar['project']['venvs'] }}/django/bin/activate" ] && source "{{ pillar['project']['venvs'] }}/django/bin/activate"
        # Recreate the current virtual Python environment
        function recreate () {
            : "${VIRTUAL_ENV:?no virtual Python environment detected}"
            VENV_DIR=$VIRTUAL_ENV
            deactivate
            /usr/bin/env python3 -m venv --clear $VENV_DIR
            source $VENV_DIR/bin/activate
        }
    - template: jinja
    - append_if_not_found: True
