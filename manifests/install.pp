# @summary installs nscd
# @api private
#
class nscd::install (
  $pkg_ensure = $nscd::pkg_ensure
) {
  stdlib::ensure_packages('nscd', { ensure => $pkg_ensure, })
}
