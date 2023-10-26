# @summary hash of configuration in nscd.conf
type Nscd::Database = Struct[
  {
    Optional['passwd']   => Nscd::Database::Settings,
    Optional['group']    => Nscd::Database::Settings,
    Optional['hosts']    => Nscd::Database::Settings,
    Optional['services'] => Nscd::Database::Settings,
    Optional['netgroup'] => Nscd::Database::Settings,
  }
]
