class ntp (
  Array $servers,
) {
  package { 'ntp':
    ensure => installed,
  }

  file { '/etc/ntp.conf':
    ensure  => file,
    content => template("${module_name}/ntp.conf.erb"),
    require => Package['ntp'],
  }

  service { 'ntp':
    ensure    => running,
    enable    => true,
    subscribe => File['/etc/ntp.conf'],
  }
}
