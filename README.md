# Puppet module for nscd

[![Build Status](https://travis-ci.org/voxpupuli/puppet-nscd.png?branch=master)](https://travis-ci.org/voxpupuli/puppet-nscd)
[![Code Coverage](https://coveralls.io/repos/github/voxpupuli/puppet-nscd/badge.svg?branch=master)](https://coveralls.io/github/voxpupuli/puppet-nscd)
[![Puppet Forge](https://img.shields.io/puppetforge/v/puppet/nscd.svg)](https://forge.puppetlabs.com/puppet/nscd)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/puppet/nscd.svg)](https://forge.puppetlabs.com/puppet/nscd)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/puppet/nscd.svg)](https://forge.puppetlabs.com/puppet/nscd)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/puppet/nscd.svg)](https://forge.puppetlabs.com/puppet/nscd)


## Overview

Configures `/etc/nscd.conf` and controls nscd service.

## Examples

```puppet
include ::nscd
```

```puppet
class{'nscd':
  nscd_group_cache => 'yes',
}
```

## Usage

Generated puppet strings documentation with examples is available from
https://voxpupuli.org/puppet-nscd/

## Authors

* Vox Pupuli <voxpupuli@groups.io>
* Steve Traylen <steve.traylen@cern.ch>



