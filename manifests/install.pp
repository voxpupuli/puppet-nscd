# == Class: nscd::install
# Installs nscd packages.
#
class nscd::install (
  $pkg_ensure = $nscd::pkg_ensure
) inherits nscd {
  package{'nscd':
    ensure => $pkg_ensure,
  }
}
