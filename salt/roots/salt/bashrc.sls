Create bin directory in home directory:
  file.directory:
    - name: {{ pillar['project']['home'] }}/bin
    - user: {{ pillar['project']['user'] }}
    - group: {{ pillar['project']['group'] }}
    - mode: 0775

Extend .bashrc:
  file.blockreplace:
    - name: {{ pillar['project']['home'] }}/.bashrc
    - marker_start: "# START managed main configuration -DO-NOT-EDIT-"
    - marker_end: "# END managed main configuration"
    - content: |
        export DB_NAME={{ pillar['db']['name'] }}
        export DB_USER={{ pillar['db']['username'] }}
        export EDITOR={{ pillar['project']['editor'] }}
        export ENV=vagrant
        export LANG=en_US.UTF-8
        export LANGUAGE=en_US.UTF-8
        export LC_ALL=en_US.UTF-8
        export PATH="${HOME}/bin:${PATH}"
        echo
        timedatectl status
    - template: jinja
    - append_if_not_found: True
