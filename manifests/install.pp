# == Class: nscd::install
# Installs nscd packages.
#
class nscd::install (
  $pkg_ensure = $nscd::pkg_ensure
) inherits nscd {
  ensure_packages('nscd', { ensure => $pkg_ensure, })
}
