include:
  - .dependencies

Install Node.js and npm:
  pkg.installed:
    - pkgs:
      - nodejs: 4.2.6~dfsg-1ubuntu4.1
      - nodejs-legacy: 4.2.6~dfsg-1ubuntu4.1
      - npm: 3.5.2-0ubuntu4

Install nvm:
  cmd.run:
    - name: curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
    - runas: {{ pillar['project']['user'] }}
    - unless: ls {{ pillar['project']['home'] }}/.nvm
    - require:
      - Install general dependencies
