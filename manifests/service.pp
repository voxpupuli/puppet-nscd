# == Class: nscd::service
# Controls the nscd service.
class nscd::service inherits nscd {
  service{'nscd':
    ensure     => $service_ensure,
    enable     => $service_enable,
    hasstatus  => true,
    hasrestart => true,
  }
}
