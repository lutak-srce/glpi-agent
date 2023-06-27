#
# == Class glpiagent::cron
#
class glpiagent::cron inherits glpiagent {

  file { $glpiagent::cron_conf:
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('glpiagent/glpi-agent-cron-conf.erb'),
  }
  file { $glpiagent::cron_dest:
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('glpiagent/glpi-agent-cron.erb'),
  }

}
