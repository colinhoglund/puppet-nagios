#
class nagios::service (
  $reload_command = $nagios::params::reload_command,
){
  require nagios::config

  if $nagios::service_manage {
    service { $nagios::service_name:
      ensure     => $nagios::service_ensure,
      enable     => $nagios::service_enable,
      name       => $nagios::service_name,
      hasstatus  => true,
      restart    => $reload_command,
    }
  }
}
