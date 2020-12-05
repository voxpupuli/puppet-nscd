# @summary controls nscd service
# @api private
#
class nscd::service (
  $service_ensure = $nscd::service_ensure,
  $service_enable = $nscd::service_enable,
  $pkg_ensure     = $nscd::pkg_ensure,
) {
  if $pkg_ensure != 'absent' {
    service { 'nscd':
      ensure => $service_ensure,
      enable => $service_enable,
    }
  }
}
