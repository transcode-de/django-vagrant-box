include:
  - .python

Create django venv:
  cmd.run:
    - name: python3 -m venv {{ pillar['project']['venvs'] }}/django
    - runas: {{ pillar['project']['user'] }}
    - unless: ls {{ pillar['project']['venvs'] }}/django
    - makedirs: True
    - require:
      - Install Python

Create bin directory in home directory:
  file.directory:
    - name: {{ pillar['project']['home'] }}/bin
    - user: {{ pillar['project']['user'] }}
    - group: {{ pillar['project']['group'] }}
    - mode: 0775

Extend .bashrc:
  file.blockreplace:
    - name: {{ pillar['project']['home'] }}/.bashrc
    - marker_start: "# START managed configuration -DO-NOT-EDIT-"
    - marker_end: "# END managed configuration"
    - content: |
        export DB_NAME={{ pillar['db']['name'] }}
        export DB_USER={{ pillar['db']['username'] }}
        export EDITOR={{ pillar['project']['editor'] }}
        export ENV=vagrant
        export LANG=en_US.UTF-8
        export LANGUAGE=en_US.UTF-8
        export LC_ALL=en_US.UTF-8
        export PATH="${HOME}/bin:${PATH}"

        source {{ pillar['project']['venvs'] }}/django/bin/activate

        if hash thefuck 2>/dev/null; then
            eval $(thefuck --alias)
        fi

        function git_config {
          git config --get ${1} >/dev/null
          if [ $? -ne 0 ]; then
              echo
              echo -n "${2}: "
              read VALUE
              git config --global ${1} "${VALUE}"
          fi
        }

        git_config user.name "Please enter your full name to be recorded in any newly created git commits"
        git_config user.email "Please enter your email address to be recorded in any newly created git commits"

        if [ -f /vagrant/.git/config ]; then
          grep gitflow /vagrant/.git/config
          if [ $? -ne 0 ]; then
            echo
            echo "Your git repository has not been initialized with support for the git-flow branching model."
            echo "Please initialize it by executing \"cd /vagrant && git flow init --defaults\""
          fi
        fi
    - template: jinja
    - append_if_not_found: True
