#
define nagios::object::contactgroup(
  $contactgroup_alias,
  $contactgroup_name    = $title,
  $ensure               = 'present',
  $contactgroup_members = undef,
  $group                = undef,
  $members              = undef,
  $mode                 = undef,
  $owner                = undef,
  $provider             = undef,
  $register             = undef,
  $target               = undef,
  $use                  = undef,
){
  include nagios

  unless $target {
    $_target = $nagios::config::contactgroup_config_file
  } else {
    $_target = $target
  }

  nagios_contactgroup { $contactgroup_name:
    ensure               => $ensure,
    alias                => $contactgroup_alias,
    contactgroup_members => $contactgroup_members,
    group                => $group,
    members              => $members,
    mode                 => $mode,
    owner                => $owner,
    provider             => $provider,
    register             => $register,
    target               => $_target,
    use                  => $use,
    notify               => Service[$nagios::service_name],
  }
}
