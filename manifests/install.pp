#
# == Class glpiagent::install
#
class glpiagent::install inherits glpiagent {

  case $facts['os']['family'] {
    'RedHat', 'CentOS': {
      package { $glpiagent::package_name:
        ensure => $glpiagent::package_ensure,
      }
    }
    /^(Debian|Ubuntu)$/: {
      package { $glpiagent::package_name:
        ensure => $glpiagent::package_ensure,
      }
    }
    default: { warning('This glpiagent module does not work on your OS.') }
  }

  file { '/etc/glpi-agent/conf.d/custom.cfg':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('glpiagent/custom.cfg.erb'),
    require => Package[$glpiagent::package_name],
  }

  file { '/var/log/glpi-agent':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

}
