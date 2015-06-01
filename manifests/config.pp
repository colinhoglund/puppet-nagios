#
class nagios::config {
  contain nagios::config::main
  contain nagios::config::cgi
}
