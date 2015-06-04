#
define nagios::object::command(
  $command_line,
  $command_name = $title,
  $ensure       = 'present',
  $group        = undef,
  $mode         = undef,
  $owner        = undef,
  $poller_tag   = undef,
  $provider     = undef,
  $target       = undef,
  $use          = undef,
){
  include nagios

  unless $target {
    $_target = $nagios::config::command_config_file
  } else {
    $_target = $target
  }

  nagios_command { $command_name:
    ensure       => $ensure,
    command_line => $command_line,
    group        => $group,
    mode         => $mode,
    owner        => $owner,
    poller_tag   => $poller_tag,
    provider     => $provider,
    target       => $_target,
    use          => $use,
    notify       => Service[$nagios::service_name],
  }
}
