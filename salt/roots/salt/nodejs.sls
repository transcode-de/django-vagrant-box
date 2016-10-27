include:
  - .dependencies

Install Node.js and npm:
  cmd.run:
    - name: curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
    - runas: {{ pillar['project']['user'] }}
    - unless: ls /etc/apt/sources.list.d/nodesource.list
  pkg.installed:
    - pkgs:
      - nodejs: 6.9.1-1nodesource1~xenial1
