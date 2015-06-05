#
define nagios::object::hostgroup(
  $alias,
  $hostgroup_name    = $title,
  $ensure            = 'present',
  $action_url        = undef,
  $group             = undef,
  $hostgroup_members = undef,
  $members           = undef,
  $mode              = undef,
  $notes             = undef,
  $notes_url         = undef,
  $owner             = undef,
  $provider          = undef,
  $realm             = undef,
  $register          = undef,
  $target            = undef,
  $use               = undef,
){
  include nagios

  unless $target {
    $_target = $nagios::config::hostgroup_config_file
  } else {
    $_target = $target
  }

  nagios_hostgroup { $hostgroup_name:
    ensure            => $ensure,
    action_url        => $action_url,
    alias             => $alias,
    group             => $group,
    hostgroup_members => $hostgroup_members,
    members           => $members,
    mode              => $mode,
    notes             => $notes,
    notes_url         => $notes_url,
    owner             => $owner,
    provider          => $provider,
    realm             => $realm,
    register          => $register,
    target            => $_target,
    use               => $use,
    notify            => Service[$nagios::service_name],
  }
}
