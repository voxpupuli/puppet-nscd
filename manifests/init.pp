# nscd class.
#
# @summary Configures /etc/ncsd.conf and controls nscd service.
#
# @example
#  include ::nscd
#
# @param pkg_ensure state of nscd package.
# @param service_ensure state of nscd service ensure
# @param service_enable state of nscd service enable
# @param hosts_cache should nscd cache host entries
# @param passwd_cache should nscd cache passwd entries
# @param group_cache should nscd cache group entries
# @param services_cache should nscd cache service entries.
# @param threads number of threads
# @prarm paranoia  enable internal restart mode.
# @param restart_interval nscd internal restart interval
class nscd (
  Enum['present','absent','latest'] $pkg_ensure  = 'present',
  Boolean  $service_ensure   = true,
  Boolean  $service_enable   = true,
  Boolean  $hosts_cache      = true,
  Boolean  $passwd_cache     = false,
  Boolean  $group_cache      = false,
  Boolean  $services_cache   = true,
  Integer  $threads          = 4,
  Boolean  $paranoia         = true,
  Integer  $restart_interval = 3600,
) {

  contain ::nscd::install
  contain ::nscd::config
  contain ::nscd::service

  Class['nscd::install']
  -> Class['nscd::config']
  ~> Class['nscd::service']
}
