# glpiagent

## Module description

Puppet module for GLPI agent. Manages both cron & service mode of operation.

Compatible with all newer RHEL (>=7) and Debian derivatives.

## Usage

Include with:
```
include glpiagent
```

For service to be fully operational, both settings service_enable and service_ensure have to be specified correctly. For example:
```
glpiagent::service_enable: true
glpiagent::service_ensure: 'running'
```

Default values of above settings are:
```
glpiagent::service_enable: false
glpiagent::service_ensure: 'stopped'
```

Server urls need to be defined:
```
glpiagent::server_url: 'http://your.server.name/glpi/front/inventory.php'
glpiagent::cron_server_url: 'http://your.server.name/glpi/front/inventory.php'
```