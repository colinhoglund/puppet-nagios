#
define nagios::object::servicedependency(
  $_naginator_name               = $title,
  $ensure                        = 'present',
  $dependency_period             = undef,
  $dependent_host_name           = undef,
  $dependent_hostgroup_name      = undef,
  $dependent_service_description = undef,
  $execution_failure_criteria    = undef,
  $group                         = undef,
  $host_name                     = undef,
  $hostgroup_name                = undef,
  $inherits_parent               = undef,
  $mode                          = undef,
  $notification_failure_criteria = undef,
  $owner                         = undef,
  $provider                      = undef,
  $register                      = undef,
  $service_description           = undef,
  $target                        = undef,
  $use                           = undef,
){
  include nagios

  unless $target {
    $_target = $nagios::config::servicedependency_config_file
  } else {
    $_target = $target
  }

  nagios_servicedependency { $_naginator_name:
    ensure                        => $ensure,
    dependency_period             => $dependency_period,
    dependent_host_name           => $dependent_host_name,
    dependent_hostgroup_name      => $dependent_hostgroup_name,
    dependent_service_description => $dependent_service_description,
    execution_failure_criteria    => $execution_failure_criteria,
    group                         => $group,
    host_name                     => $host_name,
    hostgroup_name                => $hostgroup_name,
    inherits_parent               => $inherits_parent,
    mode                          => $mode,
    notification_failure_criteria => $notification_failure_criteria,
    owner                         => $owner,
    provider                      => $provider,
    register                      => $register,
    service_description           => $service_description,
    target                        => $_target,
    use                           => $use,
  }
}
