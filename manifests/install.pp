# @api private
# This class handles the installation. Avoid modifying private classes.
class nscd::install {
  ensure_packages('nscd', { ensure => $nscd::pkg_ensure, })
}
