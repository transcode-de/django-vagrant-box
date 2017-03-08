Install general dependencies:
  pkg.installed:
    - pkgs:
      - build-essential: 12*
      - gettext: 0.19.7*
      - libffi-dev: 3.2.1*
      - libssl-dev: 1.0.2g*

Install PostgreSQL dependencies:
  pkg.installed:
    - pkgs:
      - libpq-dev: 9.5.6*

Install lxml dependencies:
  pkg.installed:
    - pkgs:
      - libxslt1-dev: 1.1.28*

Install pillow dependencies:
  pkg.installed:
    - pkgs:
      - libtiff5-dev: 4.0.6*
      - libjpeg-dev: 8c*
      - zlib1g-dev: 1:1.2.8*
      - libfreetype6-dev: 2.6.1*
      - liblcms2-dev: 2.6*
      - libwebp-dev: 0.4.4*
