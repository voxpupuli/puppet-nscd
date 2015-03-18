# == Class: nscd::install
# Installs nscd packages.
#
class nscd::install inherits nscd {
  package{'nscd':
    ensure => $pkg_ensure,
  }
}
