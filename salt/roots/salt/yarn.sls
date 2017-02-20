include:
  - nodejs

Add yarn key:
  cmd.run:
    - name: curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -

Add yarn sources list:
  file.managed:
    - name: /etc/apt/sources.list.d/yarn.list
    - user: root
    - group: root
    - mode: 0644
    - contents: |
        deb http://dl.yarnpkg.com/debian/ stable main
  cmd.run:
    - name: apt-get update

Install yarn:
  pkg.installed:
    - pkgs:
      - yarn: 0.20.3*
    - require:
      - Install Node.js and npm
