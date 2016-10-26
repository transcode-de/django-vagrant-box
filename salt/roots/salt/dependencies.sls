Install general dependencies:
  pkg.installed:
    - pkgs:
      - build-essential: 12.1ubuntu2
      - gettext: 0.19.7-2ubuntu3
      - libffi-dev: 3.2.1-4
      - libssl-dev: 1.0.2g-1ubuntu4.5

Install PostgreSQL dependencies:
  pkg.installed:
    - pkgs:
      - libpq-dev: 9.5.4-0ubuntu0.16.04

Install lxml dependencies:
  pkg.installed:
    - pkgs:
      - libxslt1-dev: 1.1.28-2.1

Install pillow dependencies:
  pkg.installed:
    - pkgs:
      - libtiff5-dev: 4.0.6-1
      - libjpeg-dev: 8c-2ubuntu8
      - zlib1g-dev: 1:1.2.8.dfsg-2ubuntu4
      - libfreetype6-dev: 2.6.1-0.1ubuntu2
      - liblcms2-dev: 2.6-3ubuntu2
      - libwebp-dev: 0.4.4-1
