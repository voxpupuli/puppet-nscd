# == Class: nscd::service
# Controls the nscd service.
class nscd::service (
  $service_ensure = $nscd::service_ensure,
  $service_enable = $nscd::service_enable
) inherits nscd {

  service{'nscd':
    ensure     => $nscd::service_ensure,
    enable     => $nscd::service_enable,
    hasstatus  => true,
    hasrestart => true,
    require    => Class['nscd::config'],
    subscribe  => Class['nscd::config']
  }
}
