#
class nagios::config::cgi (
  $physical_html_path                       = $nagios::params::physical_html_path,
  $url_html_path                            = $nagios::params::url_html_path,
  $show_context_help                        = $nagios::params::show_context_help,
  $use_pending_states                       = '1',
  $nagios_check_command                     = $nagios::params::nagios_check_command,
  $use_authentication                       = '1',
  $use_ssl_authentication                   = '0',
  $default_user_name                        = undef,
  $authorized_for_system_information        = 'nagiosadmin',
  $authorized_for_configuration_information = 'nagiosadmin',
  $authorized_for_system_commands           = 'nagiosadmin',
  $authorized_for_all_services              = 'nagiosadmin',
  $authorized_for_all_hosts                 = 'nagiosadmin',
  $authorized_for_all_service_commands      = 'nagiosadmin',
  $authorized_for_all_host_commands         = 'nagiosadmin',
  $authorized_for_read_only                 = undef,
  $statusmap_background_image               = undef,
  $color_transparency_index_r               = undef,
  $color_transparency_index_g               = undef,
  $color_transparency_index_b               = undef,
  $default_statusmap_layout                 = '5',
  $default_statuswrl_layout                 = '4',
  $statuswrl_include                        = undef,
  $ping_syntax                              = '/bin/ping -n -U -c 5 $HOSTADDRESS$',
  $refresh_rate                             = '90',
  $result_limit                             = '100',
  $escape_html_tags                         = '1',
  $host_unreachable_sound                   = undef,
  $host_down_sound                          = undef,
  $service_critical_sound                   = undef,
  $service_warning_sound                    = undef,
  $service_unknown_sound                    = undef,
  $normal_sound                             = undef,
  $action_url_target                        = '_blank',
  $notes_url_target                         = '_blank',
  $lock_author_names                        = '1',
  $enable_splunk_integration                = undef,
  $splunk_url                               = undef,
){
  $main_config_file = $nagios::main_config_file

  require nagios::config

  file { $nagios::cgi_config_file:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/cgi.erb"),
    notify  => Service[$nagios::service_name],
  }
}
