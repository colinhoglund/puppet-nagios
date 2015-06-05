#
class nagios::config::cgi (
  $physical_html_path                       = $nagios::params::physical_html_path,
  $url_html_path                            = $nagios::params::url_html_path,
  $show_context_help                        = $nagios::params::show_context_help,
  $use_pending_states                       = $nagios::params::use_pending_states,
  $nagios_check_command                     = $nagios::params::nagios_check_command,
  $use_authentication                       = $nagios::params::use_authentication,
  $use_ssl_authentication                   = $nagios::params::use_ssl_authentication,
  $default_user_name                        = $nagios::params::default_user_name,
  $authorized_for_system_information        = $nagios::params::authorized_for_system_information,
  $authorized_for_configuration_information = $nagios::params::authorized_for_configuration_information,
  $authorized_for_system_commands           = $nagios::params::authorized_for_system_commands,
  $authorized_for_all_services              = $nagios::params::authorized_for_all_services,
  $authorized_for_all_hosts                 = $nagios::params::authorized_for_all_hosts,
  $authorized_for_all_service_commands      = $nagios::params::authorized_for_all_service_commands,
  $authorized_for_all_host_commands         = $nagios::params::authorized_for_all_host_commands,
  $authorized_for_read_only                 = $nagios::params::authorized_for_read_only,
  $statusmap_background_image               = $nagios::params::statusmap_background_image,
  $color_transparency_index_r               = $nagios::params::color_transparency_index_r,
  $color_transparency_index_g               = $nagios::params::color_transparency_index_g,
  $color_transparency_index_b               = $nagios::params::color_transparency_index_b,
  $default_statusmap_layout                 = $nagios::params::default_statusmap_layout,
  $default_statuswrl_layout                 = $nagios::params::default_statuswrl_layout,
  $statuswrl_include                        = $nagios::params::statuswrl_include,
  $ping_syntax                              = $nagios::params::ping_syntax,
  $refresh_rate                             = $nagios::params::refresh_rate,
  $result_limit                             = $nagios::params::result_limit,
  $escape_html_tags                         = $nagios::params::escape_html_tags,
  $host_unreachable_sound                   = $nagios::params::host_unreachable_sound,
  $host_down_sound                          = $nagios::params::host_down_sound,
  $service_critical_sound                   = $nagios::params::service_critical_sound,
  $service_warning_sound                    = $nagios::params::service_warning_sound,
  $service_unknown_sound                    = $nagios::params::service_unknown_sound,
  $normal_sound                             = $nagios::params::normal_sound,
  $action_url_target                        = $nagios::params::action_url_target,
  $notes_url_target                         = $nagios::params::notes_url_target,
  $lock_author_names                        = $nagios::params::lock_author_names,
  $enable_splunk_integration                = $nagios::params::enable_splunk_integration,
  $splunk_url                               = $nagios::params::splunk_url,
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
