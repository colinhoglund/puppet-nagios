#
define nagios::object::command(
  $command_line
){
  include nagios
  nagios_command { $title:
    ensure       => present,
    command_line => $command_line,
    target       => $nagios::config::command_config_file,
  }
}
