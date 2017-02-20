Install wkhtmltopdf:
  pkg.installed:
    - pkgs:
      - wkhtmltopdf: 0.12.2.4*
      - xvfb: 2:1.18.4*
