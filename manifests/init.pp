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
# @param passwd_positive_ttl positive time to live for passwords database.
# @param passwd_negative_ttl negative time to live for passwords database.
# @param group_positive_ttl positive time to live for groups database.
# @param group_negative_ttl negative time to live for groups database.
# @param hosts_positive_ttl positive time to live for hosts database.
# @param hosts_negative_ttl negative time to live for hosts database.
# @param services_positive_ttl positive time to live for services database.
# @param services_negative_ttl negative time to live for services database.
class nscd (
  Enum['present','absent','latest'] $pkg_ensure            = 'present',
  Boolean                           $service_ensure        = true,
  Boolean                           $service_enable        = true,
  Boolean                           $hosts_cache           = true,
  Boolean                           $passwd_cache          = false,
  Boolean                           $group_cache           = false,
  Boolean                           $services_cache        = true,
  Integer                           $threads               = 4,
  Boolean                           $paranoia              = true,
  Integer                           $restart_interval      = 3600,
  Integer                           $passwd_negative_ttl   = 20,
  Integer                           $passwd_positive_ttl   = 600,
  Integer                           $group_negative_ttl    = 60,
  Integer                           $group_positive_ttl    = 3600,
  Integer                           $hosts_negative_ttl    = 20,
  Integer                           $hosts_positive_ttl    = 3600,
  Integer                           $services_negative_ttl = 20,
  Integer                           $services_positive_ttl = 28800,
) {

  contain ::nscd::install
  contain ::nscd::config
  contain ::nscd::service

  Class['nscd::install']
  -> Class['nscd::config']
  ~> Class['nscd::service']
}
