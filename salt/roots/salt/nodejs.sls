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
