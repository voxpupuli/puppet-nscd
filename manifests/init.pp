# nscd class.
#
# @summary Configures /etc/ncsd.conf and controls nscd service.
#
# @example
#  class{'nscd':
#    dbconfigs  => {
#      'passwd' => {'enable-cache'         => true,
#                   'maximum-time-to-live' => 100,
#                   },
#      'group' => {'enable-cache'         => true,
#                  'maximum-time-to-live' => 100,
#                 },
#
#    }
#
# Note for each database at least the `enable-cache` key
# must be specified.
#
# @param pkg_ensure state of nscd package.
# @param service_ensure state of nscd service ensure
# @param service_enable state of nscd service enable
# @param threads number of threads.
# @param max_threads maximum number of threads.
# @prarm paranoia  enable internal restart mode.
# @param restart_interval nscd internal restart interval
# @param user specify which user should run nscd
# @param stat_user which users can query statistics
# @param debug_level debug level
# @param reload_count any many reload attempts to make
# @param logfile specify a debug log file location.
# @dbconfig configuration for each of the passwd, group, hosts and service database.

class nscd (
  Nscd::Database                    $dbconfig,
  Enum['present','absent','latest'] $pkg_ensure       = 'present',
  Boolean                           $service_ensure   = true,
  Boolean                           $service_enable   = true,
  String[1]                         $user             = 'root',
  Optional[String[1]]               $stat_user     = undef,
  Integer                           $threads          = 5,
  Integer                           $max_threads      = 32,
  Boolean                           $paranoia         = false,
  Optional[Integer]                 $restart_interval = undef,
  Integer                           $debug_level      = 0,
  Integer                           $reload_count     = 5,
  Optional[Stdlib::UnixPath]        $logfile          = undef,
) {



  contain nscd::install
  contain nscd::config
  contain nscd::service

  Class['nscd::install']
  -> Class['nscd::config']
  ~> Class['nscd::service']
}
