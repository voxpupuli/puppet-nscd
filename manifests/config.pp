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
# [*nscd_paranoia*]
# Set to yes or no, should paranoia be used, default no.
#
# [*nscd_restart_interval*]
# Inteval in seconds to restart at if paranoid. Default 360 seconds.

# === Authors
# Steve Traylen, CERN, <steve.traylen@cern.ch>
#
class nscd::config ($nscd_hosts_cache  = hiera('nscd_hosts_cache','yes'),
                    $nscd_passwd_cache = hiera('nscd_passwd_cache','no'),
                    $nscd_group_cache  = hiera('nscd_group_cache','no'),
                    $nscd_service_cache  = hiera('nscd_service_cache','yes'),
                    $nscd_threads = hiera('nscd_threads','4'),
                    $nscd_paranoia  = hiera('nscd_paranoia','no'),
                    $nscd_restart_interval  = hiera('nscd_restart_interval','3600')
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
     if ! ( $nscd_paranoia in ['yes','no'] ) {
        fail("nscd_paranoia must be yes or no")
     }


     file{'/etc/nscd.conf':
        ensure  => present,
        content => template('nscd/nscd.conf.erb'),
        require => Package['nscd'],
        notify  => Service['nscd']
     }
}

