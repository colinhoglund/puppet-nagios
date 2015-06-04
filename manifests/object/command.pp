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
  $target       = $nagios::config::command_config_file,
  $use          = undef,
){
  include nagios

  nagios_command { $command_name:
    ensure       => $ensure,
    command_line => $command_line,
    group        => $group,
    mode         => $mode,
    owner        => $owner,
    poller_tag   => $poller_tag,
    provider     => $provider,
    target       => $target,
    use          => $use,
  }
}
