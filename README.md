# Puppet module for nscd

[![Build Status](https://github.com/voxpupuli/puppet-nscd/workflows/CI/badge.svg)](https://github.com/voxpupuli/puppet-nscd/actions?query=workflow%3ACI)
[![Release](https://github.com/voxpupuli/puppet-nscd/actions/workflows/release.yml/badge.svg)](https://github.com/voxpupuli/puppet-nscd/actions/workflows/release.yml)
[![Puppet Forge](https://img.shields.io/puppetforge/v/puppet/nscd.svg)](https://forge.puppetlabs.com/puppet/nscd)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/puppet/nscd.svg)](https://forge.puppetlabs.com/puppet/nscd)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/puppet/nscd.svg)](https://forge.puppetlabs.com/puppet/nscd)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/puppet/nscd.svg)](https://forge.puppetlabs.com/puppet/nscd)
[![puppetmodule.info docs](https://www.puppetmodule.info/images/badge.png)](https://www.puppetmodule.info/m/puppet-nscd)
[![Apache-2.0 License](https://img.shields.io/github/license/voxpupuli/puppet-nscd.svg)](LICENSE)

## Overview

Configures `/etc/nscd.conf` and controls nscd service.

## Examples

Including the class should configure nscd with default OS configuration.
```puppet
include ::nscd
```

A full set of configurations that can be set.

```puppet
class { 'nscd':
  pkg_ensure => 'latest',
  service_ensure => true,
  service_enable => true,
  stat_user => 'nobody',
  threads   => 10,
  max_threads => 22,
  paranoia => true,
  restart_interval => 100,
  debug_level => 5,
  reload_count => 20,
  logfile => '/var/log/nscd_log.log',
  dbconfig => {
    'passwd' => {
      'enable-cache'          => true,
      'positive-time-to-live' => 100,
      'negative-time-to-live' => 23,
      'suggested-size'        => 1234567,
      'check-files'           => true,
      'persistent'            => true,
      'shared'                => true,
      'max-db-size'           => 12345678900,
      'auto-propagate'        => true,
    },
    'group' => {
      'enable-cache'          => true,
      'positive-time-to-live' => 100,
      'negative-time-to-live' => 23,
      'suggested-size'        => 1234567,
      'check-files'           => true,
      'persistent'            => true,
      'shared'                => true,
      'max-db-size'           => 12345678900,
      'auto-propagate'        => true,
    },
    'hosts' => {
      'enable-cache'          => true,
      'positive-time-to-live' => 100,
      'negative-time-to-live' => 23,
      'suggested-size'        => 1234567,
      'check-files'           => true,
      'persistent'            => true,
      'shared'                => true,
      'max-db-size'           => 12345678900,
      'auto-propagate'        => true,
    },
  'services' => {
    'enable-cache'          => true,
    'positive-time-to-live' => 100,
    'negative-time-to-live' => 23,
    'suggested-size'        => 1234567,
    'check-files'           => true,
    'persistent'            => true,
    'shared'                => true,
    'max-db-size'           => 12345678900,
    'auto-propagate'        => true,
  },
  'netgroup' => {
    'enable-cache'          => true,
    'positive-time-to-live' => 100,
    'negative-time-to-live' => 23,
    'suggested-size'        => 1234567,
    'check-files'           => true,
    'persistent'            => true,
    'shared'                => true,
    'max-db-size'           => 12345678900,
    'auto-propagate'        => true,
    },
  },
}
```

The only compulsory key per database is `enable-cache`. If
false also subsequent keys for that database will be ignored.

The `dbconfig` parameter is configured with a `lookup_option`
of a deep merge. So particular settings can be appended or overridden
from hiera.

```yaml
nscd::dbconfig:
  netgroup:
    check-files: false
  services:
    enable-cache: false
```

## Usage

Generated puppet strings documentation with examples is available from
[REFERENCE.md](REFERENCE.md)

## Authors

* Vox Pupuli <voxpupuli@groups.io>
* Steve Traylen <steve.traylen@cern.ch>



