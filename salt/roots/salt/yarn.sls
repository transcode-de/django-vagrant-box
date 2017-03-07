include:
  - nodejs

Add yarn repository:
  pkgrepo.managed:
    - name: deb http://dl.yarnpkg.com/debian/ stable main
    - file: /etc/apt/sources.list.d/yarn.list
    - key_url: https://dl.yarnpkg.com/debian/pubkey.gpg
    - require_in:
      - Install yarn

Install yarn:
  pkg.installed:
    - pkgs:
      - yarn: 0.20.3*
    - require:
      - Install Node.js and npm
