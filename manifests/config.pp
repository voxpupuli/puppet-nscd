# == Class nscd::config
# Configures nscd.
#
class nscd::config {
  file{'/etc/nscd.conf':
    ensure  => present,
    content => template('nscd/nscd.conf.erb'),
  }
}

