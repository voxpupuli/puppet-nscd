# == Class: nscd
#
# Manages /etc/nscd.conf file and service.
#
# === Parameters
#  pkg_ensure                   Desired state of nscd package.
#                               Default is present.
#                               type: string
#                               valid values: 'present' or 'absent' or 'lastest'
#
#  service_ensure               Desired state of nscd service.
#                               Default is running.
#                               type: string
#                               valid values: 'running' or 'stopped'
#
#  service_enable               Should nscd start on boot.
#                               Default is true.
#                               type: boolean
#
#                               valid values: true or false
#  nscd_hosts_cache::           Should nscd cache hosts queries.
#                               Default is yes.
#                               type: string
#                               valid values: 'yes' or 'no'
#
#  nscd_passwd_cache::          Should nscd cache passwd queries.
#                               Default is no.
#                               type: string
#                               valid values: 'yes' or 'no'
#
#  nscd_group_cache::           Should nscd cache group queries.
#                               Default is no.
#                               type: string
#                               valid values: 'yes' or 'no'
#
#  nscd_service_cache::         Should nscd cache service queries.
#                               Default is yes.
#                               type: string
#                               valid values: 'yes' or 'no'
#
#  nscd_threads::               How many threads should nscd use.
#                               Default is 4.
#                               type: integer
#
#  nscd_paranoia::              Should nscd restart itself periodically.
#                               Default is no.
#                               type: string
#                               valid values: 'yes' or 'no'
#
#  nscd_restart_interval::      The interval in that nscd restarts itself
#                               if nscd_paranoia is enabled.
#                               Default is 3600.
#                               type: integer
#
# === Examples
#
#  class { 'nscd': }
#
# === Authors
#
# Steve Traylen <steve.traylen@cern.ch>
# Arnold Bechtoldt <mail@arnoldbechtoldt.com>
# Martin Pfeifer <martin.pfeifer@gmail.com>
#
# === Copyright
#
# Copyright 2011 CERN Steve Traylen
#
class nscd (
  $pkg_ensure            = 'present',
  $service_ensure        = 'running',
  $service_enable        = true,
  $nscd_hosts_cache      = hiera('nscd_hosts_cache','yes'),
  $nscd_passwd_cache     = hiera('nscd_passwd_cache','no'),
  $nscd_group_cache      = hiera('nscd_group_cache','no'),
  $nscd_service_cache    = hiera('nscd_service_cache','yes'),
  $nscd_threads          = hiera('nscd_threads','4'),
  $nscd_paranoia         = hiera('nscd_paranoia','no'),
  $nscd_restart_interval = hiera('nscd_restart_interval','3600')
) {

  if ! ( $pkg_ensure in ['present','absent','latest'] ) {
    fail('pkg_ensure must be present, absent or latest')
  }
  if ! ( $service_ensure in ['running','stopped'] ) {
    fail('service_ensure must be running or stopped')
  }
  if ! ( $nscd_hosts_cache in ['yes','no'] ) {
    fail('nscd_hosts_cache must be yes or no')
  }
  if ! ( $nscd_passwd_cache in ['yes','no'] ) {
    fail('nscd_hosts_cache must be yes or no')
  }
  if ! ( $nscd_group_cache in ['yes','no'] ) {
    fail('nscd_hosts_cache must be yes or no')
  }
  if ! ( $nscd_service_cache in ['yes','no'] ) {
    fail('nscd_service_cache must be yes or no')
  }
  if ! ( $nscd_paranoia in ['yes','no'] ) {
    fail('nscd_paranoia must be yes or no')
  }

  include ::nscd::install
  include ::nscd::config
  include ::nscd::service

  anchor{"${name}::begin":}
  -> Class['nscd::install']
  -> Class['nscd::config']
  ~> Class['nscd::service']
  -> anchor{"${name}::end":}
}
