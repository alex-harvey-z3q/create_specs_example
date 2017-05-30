class ntp::configure (
  Array $servers = $ntp::servers,
) {
  file { '/etc/ntp.conf':
    ensure  => file,
    content => template("${module_name}/ntp.conf.erb"),
  }
}
