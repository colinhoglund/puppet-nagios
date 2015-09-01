#
class nagios::config (
  $command_config_file           = "${nagios::cfg_dir}/commands.cfg",
  $contact_config_file           = "${nagios::cfg_dir}/contacts.cfg",
  $contactgroup_config_file      = "${nagios::cfg_dir}/contactgroups.cfg",
  $host_config_file              = "${nagios::cfg_dir}/hosts.cfg",
  $hostdependency_config_file    = "${nagios::cfg_dir}/hostdependencys.cfg",
  $hostescalation_config_file    = "${nagios::cfg_dir}/hostescalations.cfg",
  $hostgroup_config_file         = "${nagios::cfg_dir}/hostgroups.cfg",
  $service_config_file           = "${nagios::cfg_dir}/services.cfg",
  $servicedependency_config_file = "${nagios::cfg_dir}/servicedependencys.cfg",
  $serviceescalation_config_file = "${nagios::cfg_dir}/serviceescalations.cfg",
  $servicegroup_config_file      = "${nagios::cfg_dir}/servicegroups.cfg",
  $timeperiod_config_file        = "${nagios::cfg_dir}/timeperiods.cfg",
){
  require nagios::install

  include nagios::config::main
  include nagios::config::cgi
  include nagios::config::resource
  if $nagios::default_objects { include nagios::config::default }

  file {
    $nagios::cfg_dir:
      ensure  => directory,
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      recurse => true,
      purge   => true;
    [$command_config_file,
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
