******************
Django Vagrant Box
******************

.. image:: https://img.shields.io/badge/atlas-transcode%2Fdjango-brightgreen.svg
    :target: https://atlas.hashicorp.com/transcode/boxes/django
    :alt: Vagrant box transcode/django

.. image:: https://requires.io/github/transcode-de/django-vagrant-box/requirements.svg?branch=master
    :target: https://requires.io/github/transcode-de/django-vagrant-box/requirements/?branch=master
    :alt: Requirements Status

A `Vagrant <https://www.vagrantup.com/>`_ box for
`VirtualBox <https://www.virtualbox.org/>`_ to develop
`Django <https://www.djangoproject.com/>`_ projects.

Base box is a `Boxcutter Ubuntu box <https://github.com/boxcutter/ubuntu>`_
running `Ubuntu Server <https://www.ubuntu.com/server>`_ 16.04 LTS.

Features
========

This Vagrant box comes with pre-installed packages that are useful for
everyday Django development.

Programming Languages
---------------------

.. class:: compact

    - `Python <https://www.python.org/>`_ 3.5.2
    - `Node.js <https://nodejs.org/en/>`_ 6.9.x (LTS version)

Package Managers
----------------

.. class:: compact

    - `npm <https://www.npmjs.com/>`_ 3.10.x
    - `pip <https://pip.pypa.io/>`_ 8.1.1
    - `yarn <https://yarnpkg.com/>`_ 0.20.3

Databases
---------

.. class:: compact

    - `PostgreSQL <http://www.postgresql.org/>`_ 9.5 and libpq-dev 9.5.5
    - `SQLite <https://www.sqlite.org/>`_ 3.11.0

Development Tools
-----------------

.. class:: compact

    - `ack <http://beyondgrep.com/>`_ 2.14
    - `cloc <https://github.com/AlDanial/cloc>`_ 1.60
    - `curl <http://curl.haxx.se/>`_ 7.47.0
    - `gettext <https://www.gnu.org/software/gettext/>`_ 0.19.7
    - `Git <https://git-scm.com/>`_ 2.7.4
    - `git-flow (AVH Edition) <https://github.com/petervanderdoes/gitflow-avh>`_ 1.9.1
    - `bash-git-prompt <https://github.com/magicmonty/bash-git-prompt>`_ 2.6.1
    - `Graphviz <http://www.graphviz.org/>`_ 2.38.0
    - `httpie <https://httpie.org/>`_ 0.9.2
    - `iftop <http://www.ex-parrot.com/~pdw/iftop/>`_ 1.0pre4
    - `jq <https://github.com/stedolan/jq>`_ 1.5
    - `Screen <https://www.gnu.org/software/screen/>`_ 4.3.1
    - `The Silver Searcher <https://github.com/ggreer/the_silver_searcher>`_ 0.31.0
    - `thefuck <https://github.com/nvbn/thefuck>`_ 3.14
    - `tig <http://jonas.nitro.dk/tig/>`_ 2.0.2
    - `tree <http://mama.indstate.edu/users/ice/tree/>`_ 1.7.0

Editors
-------

.. class:: compact

    - `nano <http://www.nano-editor.org/>`_ 2.5.3
    - `Vim <http://www.vim.org/>`_ 7.4.1689

Other
-----

.. class:: compact

    - An empty "django" Python virtual environment, automatically activated after login
    - `Glances <https://nicolargo.github.io/glances/>`_ 2.7.1, to monitor the box itself
    - `wkhtmltopdf <http://wkhtmltopdf.org/>`_ 0.12.2.4 with xvfb 1.18.4
    - `lxml <https://github.com/lxml/lxml>`_ dependencies

        - libxslt1-dev 1.1.28

    - `pillow <https://python-pillow.github.io/>`_ dependencies

        - libtiff5-dev 4.0.6
        - libjpeg-dev 8c
        - zlib1g-dev 1.2.8
        - libfreetype6-dev 2.6.1
        - liblcms2-dev 2.6
        - libwebp-dev 0.4.4

Configuration
=============

- During the first login you will be asked for your full name and email address to be used for your Git commits
- Git has already been configured with ``push.default = simple``
- A PostgreSQL database named "django" has already been created for you
- User and password for the PostgreSQL database are both ``django``
- PostgreSQL database name and user are also available as environment variables ``DB_NAME`` and ``DB_USER``
- APT is configured to use German Ubuntu mirror servers
- An environment variable ``ENV=vagrant`` has been set, to be used in scripts etc.
- Port 8000 on the guest will be forwarded to the same port on the host (usually used for the Django development web server)
- Port 61208 on the guest will be forwarded to the same port on the host (used for the Glances web server)
- Auto correction for port forwarding is enabled, so port numbers can be different - use the ``vagrant port`` command to display them
- Timezone is set to Europe/Berlin

Installation
============

Download `Vagrant 1.8 <https://www.vagrantup.com/downloads.html>`_ and
`VirtualBox 5.0 <https://www.virtualbox.org/>`_ for your operating system and
architecture, then install both.

Usage
=====

To create and boot a new Vagrant box, run:

::

    $ vagrant init -m transcode/django
    $ vagrant up

Now connect to the new box:

::

    $ vagrant ssh

That's it! Now change your working directory to ``/vagrant`` and start working
on your Django project!

Building and uploading a Vagrant box
====================================

This repository contains a ``Makefile`` with tasks to build, package and upload
the Vagrant box to Amazon S3.

To build and upload a Vagrant box run:

::

    $ git clone https://github.com/transcode-de/django-vagrant-box
    $ make all

Code of Conduct
===============

Everyone interacting in the django-vagrant-box project's codebases, issue
trackers, chat rooms and mailing lists is expected to follow the
`PyPA Code of Conduct <https://www.pypa.io/en/latest/code-of-conduct/>`_.

License
=======

Distributed under the BSD 3-Clause license.

Copyright (c) 2016, Markus Zapke-Gründemann
