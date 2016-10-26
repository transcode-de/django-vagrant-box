Install git and extras:
  pkg.installed:
    - pkgs:
      - git: 1:2.7.4-0ubuntu1
      - git-flow: 1.9.1-1
      - tig: 2.0.2-2build1

Configure git push default setting:
  git.config_set:
    - name: push.default
    - value: simple
    - user: {{ pillar['project']['user'] }}
    - global: True
