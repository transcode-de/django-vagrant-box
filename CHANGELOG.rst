*********
Changelog
*********

.. http://keepachangelog.com/en/0.3.0/

Unreleased
==========

Added
-----

- Added recreate command to recreate the current virtual Python environment
- Added pgAdmin4
- Added ranger console file manager (fixes issue #11)
- Added timedatectl status to .bashrc
- Set timezone to Europe/Berlin

Changed
-------

- Upgraded to Vagrant 1.9 (fixes issue #25)
- Switched to pyup.io for Python requirements upgrades
- Upgraded ranger to 1.9.0b5
- Updated copyright for 2017
- Upgraded yarn to 0.20.3
- Use less strict versions for Ubuntu packages (fixes issue #10)
- Changed git-flow URL (we are using "git-flow (AVH Edition)")
- Upgraded glances to 2.8.2
- Upgraded thefuck to 3.14

Fixed
-----

- Configured VBoxService for better time synchronization

1.1.0 2016-11-15
================

Added
-----

- Added bash-git-prompt
- Added yarn
- Specified VirtualBox minor version to install

Changed
-------

- Moved all application specific .bashrc contents to their respective states
- Upgraded libpq-dev to 9.5.5-0ubuntu0.16.04

Fixed
-----

- Fixed git.config_set states, which were using a wrong arguments
- Fixed tig configuration, which was incompatible with 2.0.2
- Use full path to thefuck binary in .bashrc

1.0.2 2016-10-31
================

Added
-----

- Extended configuration documentation
- Added versions to README.rst
- Python requirements are watched by requires.io

Changed
-------

- Minimized box size (again, reducing size to ~600 MB)
- Moved all Python requirements to separate requirement files

Fixed
-----

- Fixed typo in gitflow regular expression in .bashrc

1.0.1 2016-10-27
================

Added
-----

- Added "ff" and "glog" git aliases and tig configuration

Changed
-------

- Upgraded Node.js to 6.9.1-1nodesource1~xenial1 (official LTS)
- Configured box to use two CPUs and 1024 MB RAM by default
- Minimized box size

Removed
-------

- Removed nvm

Fixed
-----

- Fixed Glances service
- Fixed gitflow regular expression in .bashrc

1.0.0 2016-10-27
================

- Initial release
