# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## [v4.0.0](https://github.com/voxpupuli/puppet-nscd/tree/v4.0.0) (2023-10-26)

[Full Changelog](https://github.com/voxpupuli/puppet-nscd/compare/v3.0.0...v4.0.0)

**Breaking changes:**

- Drop Debian 8, Add Debian 11/12 support [\#84](https://github.com/voxpupuli/puppet-nscd/pull/84) ([bastelfreak](https://github.com/bastelfreak))
- Drop EoL Ubuntu 16.04 support [\#81](https://github.com/voxpupuli/puppet-nscd/pull/81) ([bastelfreak](https://github.com/bastelfreak))
- puppetlabs/stdlib: Require 9.x [\#79](https://github.com/voxpupuli/puppet-nscd/pull/79) ([bastelfreak](https://github.com/bastelfreak))
- Drop Puppet 6 support [\#73](https://github.com/voxpupuli/puppet-nscd/pull/73) ([bastelfreak](https://github.com/bastelfreak))

**Implemented enhancements:**

- Add Ubuntu 20.04/22.04 support [\#83](https://github.com/voxpupuli/puppet-nscd/pull/83) ([bastelfreak](https://github.com/bastelfreak))
- Add EL9 support [\#80](https://github.com/voxpupuli/puppet-nscd/pull/80) ([bastelfreak](https://github.com/bastelfreak))
- Add AlmaLinux/Rocky support [\#78](https://github.com/voxpupuli/puppet-nscd/pull/78) ([bastelfreak](https://github.com/bastelfreak))
- Add Puppet 8 support [\#76](https://github.com/voxpupuli/puppet-nscd/pull/76) ([bastelfreak](https://github.com/bastelfreak))
- puppetlabs/stdlib: Allow 9.x [\#75](https://github.com/voxpupuli/puppet-nscd/pull/75) ([bastelfreak](https://github.com/bastelfreak))
- Allow puppetlabs/stdlib 6.x [\#60](https://github.com/voxpupuli/puppet-nscd/pull/60) ([dhoppe](https://github.com/dhoppe))

**Closed issues:**

- Link to documentation in README is a 404 [\#38](https://github.com/voxpupuli/puppet-nscd/issues/38)

**Merged pull requests:**

- README.md: Update badges [\#82](https://github.com/voxpupuli/puppet-nscd/pull/82) ([bastelfreak](https://github.com/bastelfreak))
- Allow stdlib 8.0.0 [\#69](https://github.com/voxpupuli/puppet-nscd/pull/69) ([smortex](https://github.com/smortex))
- Clean up and generate strings docs [\#68](https://github.com/voxpupuli/puppet-nscd/pull/68) ([traylenator](https://github.com/traylenator))
- modulesync 3.0.0 & puppet-lint updates [\#63](https://github.com/voxpupuli/puppet-nscd/pull/63) ([bastelfreak](https://github.com/bastelfreak))
- Use voxpupuli-acceptance [\#62](https://github.com/voxpupuli/puppet-nscd/pull/62) ([ekohl](https://github.com/ekohl))
- Clean up acceptance spec helper [\#57](https://github.com/voxpupuli/puppet-nscd/pull/57) ([ekohl](https://github.com/ekohl))

## [v3.0.0](https://github.com/voxpupuli/puppet-nscd/tree/v3.0.0) (2019-10-08)

[Full Changelog](https://github.com/voxpupuli/puppet-nscd/compare/v2.0.0...v3.0.0)

Version 3 is a new major version of [puppet/nscd](https://forge.puppet.com/puppet/nscd).  For most use cases, it is backwards incompatible and users will need to modify their declarations of the `nscd` class.

The previous parameters such as

* passwd_positive_ttl positive time to live for passwords database.
* passwd_negative_ttl negative time to live for passwords database.
* enable_passwd enable password cache.
* ....

are now all removed and instead all database parameters are specified with the
dbconfig parameter. e.g.

```puppet
class{'nscd':
  dbconfig => {
    'passwd' => {
      'enable-cache' => true,
      'positive-time-to-live' => 500,
      'negative-time-to-live' => 500,
     },
    'group' => {
      'enable-cache' => true,
      'positive-time-to-live' => 500,
      'negative-time-to-live' => 500,
     },
  },
}
```

The advantage of this breaking change that profits from newer puppet features is the module is much easier to maintain especially with respect to multiple OSes

**Breaking changes:**

- New dbconfig parameter replaces all per db options. [\#53](https://github.com/voxpupuli/puppet-nscd/pull/53) ([traylenator](https://github.com/traylenator))

**Implemented enhancements:**

- The module should allow all global and per-service properties to be managed [\#40](https://github.com/voxpupuli/puppet-nscd/issues/40)
- Convert template to epp [\#51](https://github.com/voxpupuli/puppet-nscd/pull/51) ([traylenator](https://github.com/traylenator))

**Closed issues:**

- Don't use 'inherit' in sub-classes [\#15](https://github.com/voxpupuli/puppet-nscd/issues/15)

## [v2.0.0](https://github.com/voxpupuli/puppet-nscd/tree/v2.0.0) (2019-05-02)

[Full Changelog](https://github.com/voxpupuli/puppet-nscd/compare/v1.1.0...v2.0.0)

**Breaking changes:**

- modulesync 2.6.0 & drop Puppet 4 [\#48](https://github.com/voxpupuli/puppet-nscd/pull/48) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- modulesync 2.2.0 and allow puppet 6.x [\#46](https://github.com/voxpupuli/puppet-nscd/pull/46) ([bastelfreak](https://github.com/bastelfreak))

## [v1.1.0](https://github.com/voxpupuli/puppet-nscd/tree/v1.1.0) (2018-09-07)

[Full Changelog](https://github.com/voxpupuli/puppet-nscd/compare/v1.0.0...v1.1.0)

**Implemented enhancements:**

- New option max-threads defaulting to 32 [\#36](https://github.com/voxpupuli/puppet-nscd/pull/36) ([traylenator](https://github.com/traylenator))
- Fixes \#26 allow ttl to be configured [\#32](https://github.com/voxpupuli/puppet-nscd/pull/32) ([traylenator](https://github.com/traylenator))

**Closed issues:**

- Failed to install module with librarian-puppet [\#33](https://github.com/voxpupuli/puppet-nscd/issues/33)
- Make positive host ttl a configuration. [\#26](https://github.com/voxpupuli/puppet-nscd/issues/26)

**Merged pull requests:**

- drop EOL OSs; fix puppet version range [\#39](https://github.com/voxpupuli/puppet-nscd/pull/39) ([bastelfreak](https://github.com/bastelfreak))
- Rely on beaker-hostgenerator for docker nodesets [\#37](https://github.com/voxpupuli/puppet-nscd/pull/37) ([ekohl](https://github.com/ekohl))
- Fixes \#33 remove double space for librarian-puppet [\#34](https://github.com/voxpupuli/puppet-nscd/pull/34) ([traylenator](https://github.com/traylenator))
- Use docker\_sets in .sync.yml [\#24](https://github.com/voxpupuli/puppet-nscd/pull/24) ([ekohl](https://github.com/ekohl))

## [v1.0.0](https://github.com/voxpupuli/puppet-nscd/tree/v1.0.0) (2018-02-13)

[Full Changelog](https://github.com/voxpupuli/puppet-nscd/compare/puppet-nscd-0.2.0...v1.0.0)

**Breaking changes:**

- Add puppet 4 data types [\#16](https://github.com/voxpupuli/puppet-nscd/issues/16)
- BREAKING: Refactor to Puppet 4.  Drop Puppet 3 Support.  Rename some parameters. [\#11](https://github.com/voxpupuli/puppet-nscd/pull/11) ([traylenator](https://github.com/traylenator))

**Fixed bugs:**

- Correct markdown syntax [\#18](https://github.com/voxpupuli/puppet-nscd/pull/18) ([traylenator](https://github.com/traylenator))

**Closed issues:**

- Don't call hiera from init.pp [\#14](https://github.com/voxpupuli/puppet-nscd/issues/14)
- Allow booleans for yes|no parameters [\#13](https://github.com/voxpupuli/puppet-nscd/issues/13)
- Replace anchor pattern with 'contain' [\#12](https://github.com/voxpupuli/puppet-nscd/issues/12)

**Merged pull requests:**

- release 1.0.0 [\#29](https://github.com/voxpupuli/puppet-nscd/pull/29) ([bastelfreak](https://github.com/bastelfreak))
- Use boolean in README example [\#21](https://github.com/voxpupuli/puppet-nscd/pull/21) ([traylenator](https://github.com/traylenator))
- Add travis secret for puppetforge [\#19](https://github.com/voxpupuli/puppet-nscd/pull/19) ([traylenator](https://github.com/traylenator))
- ensure\_packages to avoid duplicate redef [\#7](https://github.com/voxpupuli/puppet-nscd/pull/7) ([jcpunk](https://github.com/jcpunk))

## [puppet-nscd-0.2.0](https://github.com/voxpupuli/puppet-nscd/tree/puppet-nscd-0.2.0) (2015-03-18)

[Full Changelog](https://github.com/voxpupuli/puppet-nscd/compare/puppet-nscd-0.1.0...puppet-nscd-0.2.0)

**Closed issues:**

- New release? [\#4](https://github.com/voxpupuli/puppet-nscd/issues/4)

**Merged pull requests:**

- Rewrite module [\#6](https://github.com/voxpupuli/puppet-nscd/pull/6) ([martinpfeifer](https://github.com/martinpfeifer))
- make it possible to remove/ disable nscd using class params [\#5](https://github.com/voxpupuli/puppet-nscd/pull/5) ([arnisoph](https://github.com/arnisoph))

## [puppet-nscd-0.1.0](https://github.com/voxpupuli/puppet-nscd/tree/puppet-nscd-0.1.0) (2014-12-09)

[Full Changelog](https://github.com/voxpupuli/puppet-nscd/compare/puppet-nscd-0.0.1...puppet-nscd-0.1.0)

**Merged pull requests:**

- Add parameter nscd\_threads [\#3](https://github.com/voxpupuli/puppet-nscd/pull/3) ([sagiru](https://github.com/sagiru))
- Fix deprecated variable access without \*\*@\*\*varname [\#2](https://github.com/voxpupuli/puppet-nscd/pull/2) ([bascht](https://github.com/bascht))
- Parameterize service cache [\#1](https://github.com/voxpupuli/puppet-nscd/pull/1) ([bascht](https://github.com/bascht))

## [puppet-nscd-0.0.1](https://github.com/voxpupuli/puppet-nscd/tree/puppet-nscd-0.0.1) (2012-05-21)

[Full Changelog](https://github.com/voxpupuli/puppet-nscd/compare/213a0ad00c24deba7e4696f8aac0c7a3e7a9a9c3...puppet-nscd-0.0.1)



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
