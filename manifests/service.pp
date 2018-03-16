# @api private
# This class handles the service. Avoid modifying private classes.
class nscd::service {
  service{'nscd':
    ensure => $nscd::service_ensure,
    enable => $nscd::service_enable,
  }
}
