# == Class: nscd
#
# Manages /etc/nscd.conf file and service.
#
# === Parameters
# The nscd::config class takes variables from hiera.

# === Variables
#
# === Examples
#
#  class { nscd: }
#
# === Authors
#
# Steve Traylen <steve.traylen@cern.ch>
#
# === Copyright
#
# Copyright 2011 CERN Steve Traylen
#
class nscd {
  class{'nscd::install':}
  class{'nscd::config':}
  class{'nscd::service':}
}
