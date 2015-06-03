#
class nagios::config (
  $command_config_file           = $nagios::params::command_config_file,
  $contact_config_file           = $nagios::params::contact_config_file,
  $contactgroup_config_file      = $nagios::params::contactgroup_config_file,
  $host_config_file              = $nagios::params::host_config_file,
  $hostdependency_config_file    = $nagios::params::hostdependency_config_file,
  $hostescalation_config_file    = $nagios::params::hostescalation_config_file,
  $hostgroup_config_file         = $nagios::params::hostgroup_config_file,
  $service_config_file           = $nagios::params::service_config_file,
  $servicedependency_config_file = $nagios::params::servicedependency_config_file,
  $serviceescalation_config_file = $nagios::params::serviceescalation_config_file,
  $servicegroup_config_file      = $nagios::params::servicegroup_config_file,
  $timeperiod_config_file        = $nagios::params::timeperiod_config_file,
){
  contain nagios::config::main
  contain nagios::config::cgi

  file {[
    $command_config_file,
    $contact_config_file,
    $contactgroup_config_file,
    $host_config_file,
    $hostdependency_config_file,
    $hostescalation_config_file,
    $hostgroup_config_file,
    $service_config_file,
    $servicedependency_config_file,
    $serviceescalation_config_file,
    $servicegroup_config_file,
    $timeperiod_config_file]:
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0644'
  }
}
