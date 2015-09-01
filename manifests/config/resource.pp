#
class nagios::config::resource (
  $plugins_dir = $nagios::params::plugins_dir,
  $macros = []
){
  file { $nagios::config::main::resource_file:
    ensure  => file,
    owner   => 'root',
    group   => 'nagios',
    mode    => '0640',
    content => template("${module_name}/resource.erb"),
    notify  => Service[$nagios::service_name],
  }
}
