Clean up to free some space:
  file.managed:
    - name: /root/cleanup.sh
    - user: root
    - group: root
    - mode: 0700
    - source: salt://cleanup.sh
  cmd.run:
    - name: /root/cleanup.sh > /vagrant/cleanup.log

Remove cleanup.sh script:
  file.absent:
    - name: /root/cleanup.sh
