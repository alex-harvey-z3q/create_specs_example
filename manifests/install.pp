class ntp::install {
  package { 'ntp':
    ensure => installed,
  }
}
