puppet-nscd
===========

Configure /etc/nscd.conf and nscd.

Does little more than install the nscd package
and support the on/off of databases passwd,
groups and hosts to cache or not.

Tested on RHEL and Fedora.

The module assumes that hiera is available.
