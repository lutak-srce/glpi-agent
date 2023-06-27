#
# == Class glpiagent::service
#
class glpiagent::service inherits glpiagent {

  service { $glpiagent::service_name:
    ensure => $glpiagent::service_ensure,
    enable => $glpiagent::service_enable,
  }

}
