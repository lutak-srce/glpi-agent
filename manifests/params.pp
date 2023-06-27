#
# == Class glpiagent::params
#
class glpiagent::params {
  $server_url        = undef
  $debug             = '0'
  $force             = '1'
  $lazy              = '0'
  $html              = '0'
  $json              = '0'
  $assetname_support = '2'
  $no_task           = 'deploy,esx,remoteinventory,wakeonlan'
  $no_httpd          = '1'
  $no_ssl_check      = '1'
  $logger            = 'file'
  $logfile           = '/var/log/glpi-agent/glpi-agent.log'
  $package_ensure    = 'latest'
  $cron_enable       = true
  $cron_dest         = '/etc/cron.daily/glpi-agent'
  $cron_mode         = 'cron'
  $cron_server_url   = undef
  $cron_pause        = '60'
  $cron_tag          = ''
  $service_enable    = false
  $service_name      = 'glpi-agent'
  $service_ensure    = 'stopped'

  case $::osfamily {
    'RedHat': {
      $package_name = 'glpi-agent'
      $cron_conf    = '/etc/sysconfig/glpi-agent'
    }
    'Debian': {
      # todo: maknuti srce ili staviti kroz varijablu
      $package_name = 'glpi-agent-srce'
      $cron_conf    = '/etc/default/glpi-agent'
    }
    default: {}
  }

}
