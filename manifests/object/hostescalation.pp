#
define nagios::object::hostescalation(
  $_naginator_name       = $title,
  $ensure                = 'present',
  $contact_groups        = undef,
  $contacts              = undef,
  $escalation_options    = undef,
  $escalation_period     = undef,
  $first_notification    = undef,
  $group                 = undef,
  $host_name             = undef,
  $hostgroup_name        = undef,
  $last_notification     = undef,
  $mode                  = undef,
  $notification_interval = undef,
  $owner                 = undef,
  $provider              = undef,
  $register              = undef,
  $target                = $nagios::config::hostescalation_config_file,
  $use                   = undef,
){
  include nagios

  nagios_hostescalation { $_naginator_name:
    ensure                => $ensure,
    contact_groups        => $contact_groups,
    contacts              => $contacts,
    escalation_options    => $escalation_options,
    escalation_period     => $escalation_period,
    first_notification    => $first_notification,
    group                 => $group,
    host_name             => $host_name,
    hostgroup_name        => $hostgroup_name,
    last_notification     => $last_notification,
    mode                  => $mode,
    notification_interval => $notification_interval,
    owner                 => $owner,
    provider              => $provider,
    register              => $register,
    target                => $target,
    use                   => $use,
  }
}
