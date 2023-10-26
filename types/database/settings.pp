# @summary all possible settings an nscd database can have
#
type Nscd::Database::Settings = Struct[
  {
    'enable-cache'                    => Boolean,
    Optional['positive-time-to-live'] => Integer,
    Optional['negative-time-to-live'] => Integer,
    Optional['suggested-size']        => Integer,
    Optional['check-files']           => Boolean,
    Optional['persistent']            => Boolean,
    Optional['shared']                => Boolean,
    Optional['max-db-size']           => Integer,
    Optional['auto-propagate']        => Boolean,
  }
]
