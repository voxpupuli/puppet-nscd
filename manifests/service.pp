# == Class: nscd::service
# Controls the nscd service.
class nscd::service (
  $service_ensure = $nscd::service_ensure,
  $service_enable = $nscd::service_enable,
) inherits nscd {
  service{'nscd':
    ensure     => $service_ensure,
    enable     => $service_enable,
    hasstatus  => true,
    hasrestart => true,
  }
}
