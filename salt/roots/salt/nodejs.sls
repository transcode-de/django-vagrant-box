include:
  - .dependencies

Install Node.js and npm:
  cmd.run:
    - name: curl --silent --location https://deb.nodesource.com/setup_6.x | sudo --preserve-env bash -
    - runas: {{ pillar['project']['user'] }}
    - unless: ls /etc/apt/sources.list.d/nodesource.list
  pkg.installed:
    - pkgs:
      - nodejs: 6.10*

Clone nvm repository:
  git.latest:
    - name: https://github.com/creationix/nvm.git
    - rev: v0.33.1
    - target: {{ pillar['project']['home'] }}/.nvm
    - user: {{ pillar['project']['user'] }}

Extend .bashrc for nvm:
  file.blockreplace:
    - name: {{ pillar['project']['home'] }}/.bashrc
    - marker_start: "# START managed nvm configuration -DO-NOT-EDIT-"
    - marker_end: "# END managed nvm configuration"
    - content: |
        export NVM_DIR="${HOME}/.nvm"
        [ -s "${NVM_DIR}/nvm.sh" ] && source "${NVM_DIR}/nvm.sh"
    - template: jinja
    - append_if_not_found: True
