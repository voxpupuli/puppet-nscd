#
# == Class nscd::config
# Configures nscd:
#
# === Parameters
# [*nscd_hosts_cache*]
# Set to yes or no, should hosts be cached or not by nscd.
# Default: yes
#
# [*nscd_group_cache*]
# Set to yes or no, should hosts be cached or not by nscd.
# Default: no
# 
# [*nscd_passwd_cache*]
# Set to yes or no, should hosts be cached or not by nscd.
# Default: no
#
# === Authors
# Steve Traylen, CERN, <steve.traylen@cern.ch>
#
class nscd::config ($nscd_hosts_cache  = hiera('nscd_hosts_cache','yes'),
                    $nscd_passwd_cache = hiera('nscd_passwd_cache','no'),
                    $nscd_group_cache  = hiera('nscd_group_cache','no'),
                    $nscd_service_cache  = hiera('nscd_service_cache','yes')
                   ) {


     if ! ( $nscd_hosts_cache in ['yes','no'] ) {
        fail("nscd_hosts_cache must be yes or no")
     }
     if ! ( $nscd_passwd_cache in ['yes','no'] ) {
        fail("nscd_hosts_cache must be yes or no")
     }
     if ! ( $nscd_group_cache in ['yes','no'] ) {
        fail("nscd_hosts_cache must be yes or no")
     }
     if ! ( $nscd_service_cache in ['yes','no'] ) {
        fail("nscd_service_cache must be yes or no")
     }


     file{'/etc/nscd.conf':
        ensure  => present,
        content => template('nscd/nscd.conf.erb'),
        require => Package['nscd'],
        notify  => Service['nscd']
     }
}

