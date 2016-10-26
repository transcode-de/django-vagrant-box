Replace apt sources.list:
  file.managed:
    - name: /etc/apt/sources.list
    - user: root
    - group: root
    - mode: 644
    - source: salt://apt/sources.list
  cmd.run:
    - name: apt-get update
