class ntp (
  Array $servers = $ntp::params::servers,
) {
  contain ntp::install
  contain ntp::configure
  contain ntp::service

  Class['ntp::install']
  -> Class['ntp::configure']
  ~> Class['ntp::service']
}
