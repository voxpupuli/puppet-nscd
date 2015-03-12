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
# Arnold Bechtoldt <mail@arnoldbechtoldt.com>
#
# === Copyright
#
# Copyright 2011 CERN Steve Traylen
#
class nscd (
  $pkg_ensure     = 'present',
  $service_ensure = 'running',
  $service_enable = true,
  ) {

  class{'nscd::install':}
  class{'nscd::config':}
  class{'nscd::service':}
}
