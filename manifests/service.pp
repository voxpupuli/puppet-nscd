# == Class: nscd::service
# Controls the nscd service.
class nscd::service {

  service{'nscd':
    ensure     => $nscd::service_ensure,
    enable     => $nscd::service_enable,
    hasstatus  => true,
    hasrestart => true,
    require    => Class['nscd::config'],
    subscribe  => Class['nscd::config']
  }
}
