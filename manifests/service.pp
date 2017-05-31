class ntp::service {
 service { 'ntp':
    ensure    => running,
    enable    => true,
  }
}
