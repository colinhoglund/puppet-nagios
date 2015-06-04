#
define nagios::object::hostdependency(
  $dependent_host_name,
  $host_name                     = $title,
  $ensure                        = 'present',
  $dependency_period             = undef,
  $dependent_hostgroup_name      = undef,
  $execution_failure_criteria    = undef,
  $group                         = undef,
  $hostgroup_name                = undef,
  $inherits_parent               = undef,
  $mode                          = undef,
  $notification_failure_criteria = undef,
  $owner                         = undef,
  $provider                      = undef,
  $register                      = undef,
  $target                        = undef,
  $use                           = undef,
){
  include nagios

  unless $target {
    $_target = $nagios::config::hostdependency_config_file
  } else {
    $_target = $target
  }

  nagios_hostdependency { $host_name:
    ensure                        => $ensure,
    dependency_period             => $dependency_period,
    dependent_host_name           => $dependent_host_name,
    dependent_hostgroup_name      => $dependent_hostgroup_name,
    execution_failure_criteria    => $execution_failure_criteria,
    group                         => $group,
    host_name                     => $title,
    hostgroup_name                => $hostgroup_name,
    inherits_parent               => $inherits_parent,
    mode                          => $mode,
    notification_failure_criteria => $notification_failure_criteria,
    owner                         => $owner,
    provider                      => $provider,
    register                      => $register,
    target                        => $_target,
    use                           => $use,
  }
}
