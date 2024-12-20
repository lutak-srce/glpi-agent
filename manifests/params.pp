#
# == Class glpiagent::params
#
class glpiagent::params {
  $server_url        = undef
  $debug             = '0'
  $force             = '1'
  $lazy              = '0'
  $html              = '0'
  $json              = '1'
  $assetname_support = '3'
  $no_task           = 'deploy,esx,remoteinventory,wakeonlan'
  $no_httpd          = '1'
  $no_ssl_check      = '1'
  $logger            = 'file'
  $logfile           = '/var/log/glpi-agent/glpi-agent.log'
  $package_name      = 'glpi-agent'
  $package_ensure    = 'latest'
  $cron_enable       = true
  $cron_dest         = '/etc/cron.daily/glpi-agent'
  $cron_mode         = 'cron'
  $cron_server_url   = undef
  $cron_pause        = '1800'
  $cron_tag          = ''
  $service_enable    = false
  $service_name      = 'glpi-agent'
  $service_ensure    = 'stopped'
  $additional_content = '/etc/glpi-agent-data.json'

  case $facts['os']['family'] {
    'RedHat': {
      $cron_conf    = '/etc/sysconfig/glpi-agent'
    }
    'Debian': {
      $cron_conf    = '/etc/default/glpi-agent'
    }
    default: {}
  }

}
