#
# == Class glpiagent
#
class glpiagent (
  $server_url        = $glpiagent::params::server_url,
  $debug             = $glpiagent::params::debug,
  $force             = $glpiagent::params::force,
  $lazy              = $glpiagent::params::lazy,
  $html              = $glpiagent::params::html,
  $json              = $glpiagent::params::json,
  $assetname_support = $glpiagent::params::assetname_support,
  $no_task           = $glpiagent::params::no_task,
  $no_httpd          = $glpiagent::params::no_httpd,
  $no_ssl_check      = $glpiagent::params::no_ssl_check,
  $logger            = $glpiagent::params::logger,
  $logfile           = $glpiagent::params::logfile,
  $package_name      = $glpiagent::params::package_name,
  $package_ensure    = $glpiagent::params::package_ensure,
  $cron_enable       = $glpiagent::params::cron_enable,
  $cron_mode         = $glpiagent::params::cron_mode,
  $cron_conf         = $glpiagent::params::cron_conf,
  $cron_dest         = $glpiagent::params::cron_dest,
  $cron_server_url   = $glpiagent::params::cron_server_url,
  $cron_pause        = $glpiagent::params::cron_pause,
  $cron_tag          = $glpiagent::params::cron_tag,
  $service_enable    = $glpiagent::params::service_enable,
  $service_name      = $glpiagent::params::service_name,
  $service_ensure    = $glpiagent::params::service_ensure,
) inherits glpiagent::params {

  if $glpiagent::server_url and $glpiagent::cron_server_url != undef {

    include glpiagent::install
    include glpiagent::service

    if ($cron_enable == true) {
      include glpiagent::cron
    }
  }

  else { fail('"!!! READ THIS: glpiagent::server_url or glpiagent::cron_server_url need to be configured !!!"')}

}
