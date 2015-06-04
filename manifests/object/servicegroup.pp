#
define nagios::object::servicegroup(
  $servicegroup_name    = $title,
  $ensure               = 'present',
  $action_url           = undef,
  $alias                = undef,
  $group                = undef,
  $members              = undef,
  $mode                 = undef,
  $notes                = undef,
  $notes_url            = undef,
  $owner                = undef,
  $provider             = undef,
  $register             = undef,
  $servicegroup_members = undef,
  $target               = $nagios::config::servicegroup_config_file,
  $use                  = undef,
){
  include nagios

  nagios_servicegroup { $servicegroup_name:
    ensure               => $ensure,
    action_url           => $action_url,
    alias                => $alias,
    group                => $group,
    members              => $members,
    mode                 => $mode,
    notes                => $notes,
    notes_url            => $notes_url,
    owner                => $owner,
    provider             => $provider,
    register             => $register,
    servicegroup_members => $servicegroup_members,
    target               => $target,
    use                  => $use,
  }
}
