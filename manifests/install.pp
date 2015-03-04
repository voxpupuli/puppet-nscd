# == Class: nscd::install
# Installs nscd packages.
#
class nscd::install {
  package{'nscd':
    ensure => $::nscd::pkg_ensure,
  }
}
