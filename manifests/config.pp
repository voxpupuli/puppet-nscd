# == Class nscd::config
# Configures nscd.
#
class nscd::config {
  file{'/etc/nscd.conf':
    ensure  => present,
    content => epp('nscd/nscd.conf.epp'),
    owner   => root,
    group   => root,
    mode    => '0644',
  }
}

