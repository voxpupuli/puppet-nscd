# @api private
# This class handles the configuration file. Avoid modifying private classes.
class nscd::config {
  file{'/etc/nscd.conf':
    ensure  => present,
    content => epp('nscd/nscd.conf.epp', {
      'threads'               => $nscd::threads,
      'paranoia'              => $nscd::paranoia,
      'restart_interval'      => $nscd::restart_interval,
      'passwd_cache'          => $nscd::passwd_cache,
      'passwd_positive_ttl'   => $nscd::passwd_positive_ttl,
      'passwd_negative_ttl'   => $nscd::passwd_negative_ttl,
      'group_cache'           => $nscd::group_cache,
      'group_positive_ttl'    => $nscd::group_positive_ttl,
      'group_negative_ttl'    => $nscd::group_negative_ttl,
      'hosts_cache'           => $nscd::hosts_cache,
      'hosts_positive_ttl'    => $nscd::hosts_positive_ttl,
      'hosts_negative_ttl'    => $nscd::hosts_negative_ttl,
      'services_cache'        => $nscd::services_cache,
      'services_positive_ttl' => $nscd::services_positive_ttl,
      'services_negative_ttl' => $nscd::services_negative_ttl,
      }),
    owner   => root,
    group   => root,
    mode    => '0644',
  }
}

