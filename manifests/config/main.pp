#
class nagios::config::main (
  $log_file                                    = $nagios::params::log_file,
  $object_cache_file                           = $nagios::params::object_cache_file,
  $precached_object_file                       = $nagios::params::precached_object_file,
  $resource_file                               = $nagios::params::resource_file,
  $status_file                                 = $nagios::params::status_file,
  $status_update_interval                      = $nagios::params::status_update_interval,
  $nagios_user                                 = $nagios::params::nagios_user,
  $nagios_group                                = $nagios::params::nagios_group,
  $check_external_commands                     = $nagios::params::check_external_commands,
  $command_check_interval                      = $nagios::params::command_check_interval,
  $command_file                                = $nagios::params::command_file,
  $external_command_buffer_slots               = $nagios::params::external_command_buffer_slots,
  $lock_file                                   = $nagios::params::lock_file,
  $temp_file                                   = $nagios::params::temp_file,
  $temp_path                                   = $nagios::params::temp_path,
  $event_broker_options                        = $nagios::params::event_broker_options,
  $broker_module                               = $nagios::params::broker_module,
  $log_rotation_method                         = $nagios::params::log_rotation_method,
  $log_archive_path                            = $nagios::params::log_archive_path,
  $use_syslog                                  = $nagios::params::use_syslog,
  $log_notifications                           = $nagios::params::log_notifications,
  $log_service_retries                         = $nagios::params::log_service_retries,
  $log_host_retries                            = $nagios::params::log_host_retries,
  $log_event_handlers                          = $nagios::params::log_event_handlers,
  $log_initial_states                          = $nagios::params::log_initial_states,
  $log_external_commands                       = $nagios::params::log_external_commands,
  $log_passive_checks                          = $nagios::params::log_passive_checks,
  $global_host_event_handler                   = $nagios::params::global_host_event_handler,
  $global_service_event_handler                = $nagios::params::global_service_event_handler,
  $service_inter_check_delay_method            = $nagios::params::service_inter_check_delay_method,
  $max_service_check_spread                    = $nagios::params::max_service_check_spread,
  $service_interleave_factor                   = $nagios::params::service_interleave_factor,
  $host_inter_check_delay_method               = $nagios::params::host_inter_check_delay_method,
  $max_host_check_spread                       = $nagios::params::max_host_check_spread,
  $max_concurrent_checks                       = $nagios::params::max_concurrent_checks,
  $check_result_reaper_frequency               = $nagios::params::check_result_reaper_frequency,
  $max_check_result_reaper_time                = $nagios::params::max_check_result_reaper_time,
  $check_result_path                           = $nagios::params::check_result_path,
  $max_check_result_file_age                   = $nagios::params::max_check_result_file_age,
  $cached_host_check_horizon                   = $nagios::params::cached_host_check_horizon,
  $cached_service_check_horizon                = $nagios::params::cached_service_check_horizon,
  $enable_predictive_host_dependency_checks    = $nagios::params::enable_predictive_host_dependency_checks,
  $enable_predictive_service_dependency_checks = $nagios::params::enable_predictive_service_dependency_checks,
  $soft_state_dependencies                     = $nagios::params::soft_state_dependencies,
  $time_change_threshold                       = $nagios::params::time_change_threshold,
  $auto_reschedule_checks                      = $nagios::params::auto_reschedule_checks,
  $auto_rescheduling_interval                  = $nagios::params::auto_rescheduling_interval,
  $auto_rescheduling_window                    = $nagios::params::auto_rescheduling_window,
  $sleep_time                                  = $nagios::params::sleep_time,
  $service_check_timeout                       = $nagios::params::service_check_timeout,
  $host_check_timeout                          = $nagios::params::host_check_timeout,
  $event_handler_timeout                       = $nagios::params::event_handler_timeout,
  $notification_timeout                        = $nagios::params::notification_timeout,
  $ocsp_timeout                                = $nagios::params::ocsp_timeout,
  $perfdata_timeout                            = $nagios::params::perfdata_timeout,
  $retain_state_information                    = $nagios::params::retain_state_information,
  $state_retention_file                        = $nagios::params::state_retention_file,
  $retention_update_interval                   = $nagios::params::retention_update_interval,
  $use_retained_program_state                  = $nagios::params::use_retained_program_state,
  $use_retained_scheduling_info                = $nagios::params::use_retained_scheduling_info,
  $retained_host_attribute_mask                = $nagios::params::retained_host_attribute_mask,
  $retained_service_attribute_mask             = $nagios::params::retained_service_attribute_mask,
  $retained_process_host_attribute_mask        = $nagios::params::retained_process_host_attribute_mask,
  $retained_process_service_attribute_mask     = $nagios::params::retained_process_service_attribute_mask,
  $retained_contact_host_attribute_mask        = $nagios::params::retained_contact_host_attribute_mask,
  $retained_contact_service_attribute_mask     = $nagios::params::retained_contact_service_attribute_mask,
  $interval_length                             = $nagios::params::interval_length,
  $check_for_updates                           = $nagios::params::check_for_updates,
  $bare_update_check                           = $nagios::params::bare_update_check,
  $use_aggressive_host_checking                = $nagios::params::use_aggressive_host_checking,
  $execute_service_checks                      = $nagios::params::execute_service_checks,
  $accept_passive_service_checks               = $nagios::params::accept_passive_service_checks,
  $execute_host_checks                         = $nagios::params::execute_host_checks,
  $accept_passive_host_checks                  = $nagios::params::accept_passive_host_checks,
  $enable_notifications                        = $nagios::params::enable_notifications,
  $enable_event_handlers                       = $nagios::params::enable_event_handlers,
  $process_performance_data                    = $nagios::params::process_performance_data,
  $host_perfdata_command                       = $nagios::params::host_perfdata_command,
  $service_perfdata_command                    = $nagios::params::service_perfdata_command,
  $host_perfdata_file                          = $nagios::params::host_perfdata_file,
  $service_perfdata_file                       = $nagios::params::service_perfdata_file,
  $host_perfdata_file_template                 = $nagios::params::host_perfdata_file_template,
  $service_perfdata_file_template              = $nagios::params::service_perfdata_file_template,
  $host_perfdata_file_mode                     = $nagios::params::host_perfdata_file_mode,
  $service_perfdata_file_mode                  = $nagios::params::service_perfdata_file_mode,
  $host_perfdata_file_processing_interval      = $nagios::params::host_perfdata_file_processing_interval,
  $service_perfdata_file_processing_interval   = $nagios::params::service_perfdata_file_processing_interval,
  $host_perfdata_file_processing_command       = $nagios::params::host_perfdata_file_processing_command,
  $service_perfdata_file_processing_command    = $nagios::params::service_perfdata_file_processing_command,
  $host_perfdata_process_empty_results         = $nagios::params::host_perfdata_process_empty_results,
  $service_perfdata_process_empty_results      = $nagios::params::service_perfdata_process_empty_results,
  $obsess_over_services                        = $nagios::params::obsess_over_services,
  $ocsp_command                                = $nagios::params::ocsp_command,
  $obsess_over_hosts                           = $nagios::params::obsess_over_hosts,
  $ochp_command                                = $nagios::params::ochp_command,
  $ochp_timeout                                = $nagios::params::ochp_timeout,
  $translate_passive_host_checks               = $nagios::params::translate_passive_host_checks,
  $passive_host_checks_are_soft                = $nagios::params::passive_host_checks_are_soft,
  $check_for_orphaned_services                 = $nagios::params::check_for_orphaned_services,
  $check_for_orphaned_hosts                    = $nagios::params::check_for_orphaned_hosts,
  $check_service_freshness                     = $nagios::params::check_service_freshness,
  $service_freshness_check_interval            = $nagios::params::service_freshness_check_interval,
  $service_check_timeout_state                 = $nagios::params::service_check_timeout_state,
  $check_host_freshness                        = $nagios::params::check_host_freshness,
  $host_freshness_check_interval               = $nagios::params::host_freshness_check_interval,
  $additional_freshness_latency                = $nagios::params::additional_freshness_latency,
  $enable_flap_detection                       = $nagios::params::enable_flap_detection,
  $low_service_flap_threshold                  = $nagios::params::low_service_flap_threshold,
  $high_service_flap_threshold                 = $nagios::params::high_service_flap_threshold,
  $low_host_flap_threshold                     = $nagios::params::low_host_flap_threshold,
  $high_host_flap_threshold                    = $nagios::params::high_host_flap_threshold,
  $date_format                                 = $nagios::params::date_format,
  $use_timezone                                = $nagios::params::use_timezone,
  $p1_file                                     = $nagios::params::p1_file,
  $enable_embedded_perl                        = $nagios::params::enable_embedded_perl,
  $use_embedded_perl_implicitly                = $nagios::params::use_embedded_perl_implicitly,
  $illegal_object_name_chars                   = $nagios::params::illegal_object_name_chars,
  $illegal_macro_output_chars                  = $nagios::params::illegal_macro_output_chars,
  $use_regexp_matching                         = $nagios::params::use_regexp_matching,
  $use_true_regexp_matching                    = $nagios::params::use_true_regexp_matching,
  $admin_email                                 = $nagios::params::admin_email,
  $admin_pager                                 = $nagios::params::admin_pager,
  $daemon_dumps_core                           = $nagios::params::daemon_dumps_core,
  $use_large_installation_tweaks               = $nagios::params::use_large_installation_tweaks,
  $enable_environment_macros                   = $nagios::params::enable_environment_macros,
  $free_child_process_memory                   = $nagios::params::free_child_process_memory,
  $child_processes_fork_twice                  = $nagios::params::child_processes_fork_twice,
  $debug_level                                 = $nagios::params::debug_level,
  $debug_verbosity                             = $nagios::params::debug_verbosity,
  $debug_file                                  = $nagios::params::debug_file,
  $max_debug_file_size                         = $nagios::params::max_debug_file_size,
  $allow_empty_hostgroup_assignment            = $nagios::params::allow_empty_hostgroup_assignment,
){
  $cfg_dir = $nagios::cfg_dir

  require nagios::config

  file { $nagios::main_config_file:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/nagios.erb"),
    notify  => Service[$nagios::service_name],
  }
}
