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
  $target               = $nagios::config::contactgroup_config_file,
  $use                  = undef,
){
  include nagios

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
    target               => $target,
    use                  => $use,
  }
}
