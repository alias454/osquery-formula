================
osquery-formula
================

A saltstack formula to install osquery on RHEL or Debian based systems.  
Install can  use a local downloaded package or remote repo.


Available states
================

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

.. contents::
    :local:

``osquery-repo``
------------
Manage repo files on RHEL/CentOS 7/Debian systems

``osquery.package``
----------------------------

Installs osquery using repo or local package. Get the latest package here https://osquery.io/downloads/official/

``osquery.config``
----------------------------

Sets up the configuration file using contents defined in `pillar <pillar.example>`_.

``osquery.service``
----------------------------

Enables and runs the osquery service.

``osquery.logrotate``
----------------------------

Optionally configures logrotate on the host.
