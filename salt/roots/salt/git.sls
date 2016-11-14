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

Configure git ff alias:
  git.config_set:
    - name: alias.ff
    - value: pull --ff-only
    - user: {{ pillar['project']['user'] }}
    - global: True

Configure git glog alias:
  git.config_set:
    - name: alias.glog
    - value: log --graph --decorate
    - user: {{ pillar['project']['user'] }}
    - global: True

Configure tig main-view:
  git.config_set:
    - name: tig.main-view
    - value: date:default id:yes author:abbreviated commit-title:graph=yes,refs=yes
    - user: {{ pillar['project']['user'] }}
    - global: True

Configure tig line-graphics:
  git.config_set:
    - name: tig.line-graphics
    - value: utf-8
    - user: {{ pillar['project']['user'] }}
    - global: True
