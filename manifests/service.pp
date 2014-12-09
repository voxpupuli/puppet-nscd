# == Class: nscd::service
# Controls the nscd service.
class nscd::service {

  service{'nscd':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Class['nscd::config'],
    subscribe  => Class['nscd::config']
  }
}
