******************
Django Vagrant Box
******************

A `Vagrant <https://www.vagrantup.com/>`_ box for
`VirtualBox <https://www.virtualbox.org/>`_ to develop
`Django <https://www.djangoproject.com/>`_ projects.

Base box is a `Boxcutter Ubuntu box <https://github.com/boxcutter/ubuntu>`_
running `Ubuntu Server <https://www.ubuntu.com/server>`_ 16.04 LTS.

Features
========

This Vagrant box comes with pre-installed packages that are useful for
everyday Django development.

Programming languages
---------------------

.. class:: compact

    - `Python 3 <https://www.python.org/>`_
    - `Node.js <https://nodejs.org/en/>`_

Databases
---------

.. class:: compact

    - `PostgreSQL <http://www.postgresql.org/>`_ and libpq-dev
    - `SQLite <https://www.sqlite.org/>`_

Development Tools
-----------------

.. class:: compact

    - `ack <http://beyondgrep.com/>`_
    - `The Silver Searcher <https://github.com/ggreer/the_silver_searcher>`_
    - `cloc <https://github.com/AlDanial/cloc>`_
    - `curl <http://curl.haxx.se/>`_
    - `gettext <https://www.gnu.org/software/gettext/>`_
    - `Git <https://git-scm.com/>`_
    - `git-flow <https://github.com/nvie/gitflow>`_
    - `Graphviz <http://www.graphviz.org/>`_
    - `httpie <https://httpie.org/>`_
    - `iftop <http://www.ex-parrot.com/~pdw/iftop/>`_
    - `jq <https://github.com/stedolan/jq>`_
    - `Screen <https://www.gnu.org/software/screen/>`_
    - `thefuck <https://github.com/nvbn/thefuck>`_
    - `tig <http://jonas.nitro.dk/tig/>`_
    - `tree <http://mama.indstate.edu/users/ice/tree/>`_

Editors
-------

.. class:: compact

    - `nano <http://www.nano-editor.org/>`_
    - `Vim <http://www.vim.org/>`_

Other
-----

.. class:: compact

    - An empty "django" Python virtual environment, automatically activated after login
    - `Glances <https://nicolargo.github.io/glances/>`_ to monitor the box itself
    - `wkhtmltopdf <http://wkhtmltopdf.org/>`_
    - Dependencies to build `lxml <https://github.com/lxml/lxml>`_ and `pillow <https://python-pillow.github.io/>`_ Python packages

Configuration
=============

- During the first login you will be asked for your full name and email address to be used for your git commits
- Git has already been configured with ``push.default = simple``
- A PostgreSQL database named "django" has already been created for you
- User and password for the PostgreSQL database are both ``django``
- PostgreSQL database name and user are also available as environment variables ``DB_NAME`` and ``DB_USER``
- apt is configured to use German Ubuntu mirror servers
- An environment variable ``ENV=vagrant`` has been set, to be used in scripts etc.
- Port 8000 on the guest will be forwarded to the same port on the host (usually used for the Django development web server)
- Port 61208 on the guest will be forwarded to the same port on the host (used for the Glances web server)
- Auto correction for port forwarding is enabled, so port numbers can be different - use the ``vagrant port`` command to display them

Installation
============

`Download Vagrant <https://www.vagrantup.com/downloads.html>`_ for your
operating system and architecture, then install it.

Usage
=====

To create a new Vagrant box, run:

::

    $ vagrant init -m transcode/django
    $ vagrant up

Now connect to the new box:

::

    $ vagrant ssh

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
