Add heroku repository:
  pkgrepo.managed:
    - name: deb https://cli-assets.heroku.com/branches/stable/apt ./
    - file: /etc/apt/sources.list.d/heroku.list
    - key_url: https://cli-assets.heroku.com/apt/release.key
    - require_in:
      - Install heroku CLI

Install heroku CLI:
  pkg.installed:
    - pkgs:
      - software-properties-common: 0.96.20*
      - heroku: 5.6.29*
