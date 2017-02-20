Install git and extras:
  pkg.installed:
    - pkgs:
      - git: 1:2.7.4*
      - git-flow: 1.9.1*
      - tig: 2.0.2*

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

Clone bash-git-prompt repository:
  git.latest:
    - name: https://github.com/magicmonty/bash-git-prompt.git
    - rev: 2.6.1
    - target: {{ pillar['project']['home'] }}/.bash-git-prompt
    - user: {{ pillar['project']['user'] }}

Extend .bashrc for git:
  file.blockreplace:
    - name: {{ pillar['project']['home'] }}/.bashrc
    - marker_start: "# START managed git configuration -DO-NOT-EDIT-"
    - marker_end: "# END managed git configuration"
    - content: |
        if [ -f ${HOME}/.bash-git-prompt/gitprompt.sh ]; then
          GIT_PROMPT_ONLY_IN_REPO=1
          GIT_PROMPT_SHOW_UPSTREAM=1
          GIT_PROMPT_THEME=Solarized_UserHost
          source ${HOME}/.bash-git-prompt/gitprompt.sh
        fi

        function git_config {
          git config --get ${1} >/dev/null
          if [ $? -ne 0 ]; then
              echo
              echo -n "${2}: "
              read VALUE
              git config --global ${1} "${VALUE}"
          fi
        }

        git_config user.name "Please enter your full name to be recorded in any newly created git commits"
        git_config user.email "Please enter your email address to be recorded in any newly created git commits"

        if [ -f /vagrant/.git/config ]; then
          grep "^\[gitflow" /vagrant/.git/config >/dev/null
          if [ $? -ne 0 ]; then
            echo
            echo "Your git repository has not been initialized with support for the git-flow branching model."
            echo "Please initialize it by executing \"cd /vagrant && git flow init --defaults\""
          fi
        fi
    - template: jinja
    - append_if_not_found: True
