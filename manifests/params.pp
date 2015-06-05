#
class nagios::params {
  $package_manage = true
  $package_ensure = 'present'
  $service_manage = true
  $service_enable = true
  $service_ensure = 'running'

  # cgi.cfg options
  $use_pending_states = '1'
  $use_authentication = '1'
  $use_ssl_authentication = '0'
  $default_user_name = undef
  $authorized_for_system_information = 'nagiosadmin'
  $authorized_for_configuration_information = 'nagiosadmin'
  $authorized_for_system_commands = 'nagiosadmin'
  $authorized_for_all_services = 'nagiosadmin'
  $authorized_for_all_hosts = 'nagiosadmin'
  $authorized_for_all_service_commands = 'nagiosadmin'
  $authorized_for_all_host_commands = 'nagiosadmin'
  $authorized_for_read_only = undef
  $statusmap_background_image = undef
  $color_transparency_index_r = undef
  $color_transparency_index_g = undef
  $color_transparency_index_b = undef
  $default_statusmap_layout = '5'
  $default_statuswrl_layout = '4'
  $statuswrl_include = undef
  $ping_syntax = '/bin/ping -n -U -c 5 $HOSTADDRESS$'
  $refresh_rate = '90'
  $result_limit = '100'
  $escape_html_tags = '1'
  $host_unreachable_sound = undef
  $host_down_sound = undef
  $service_critical_sound = undef
  $service_warning_sound = undef
  $service_unknown_sound = undef
  $normal_sound = undef
  $action_url_target = '_blank'
  $notes_url_target = '_blank'
  $lock_author_names = '1'
  $enable_splunk_integration = undef
  $splunk_url = undef

  # nagios.cfg options
  $status_update_interval = '10'
  $nagios_user = 'nagios'
  $nagios_group = 'nagios'
  $check_external_commands = '1'
  $command_check_interval = '-1'
  $external_command_buffer_slots = '4096'
  $temp_path = '/tmp'
  $event_broker_options = '-1'
  $broker_module = undef
  $log_rotation_method = 'd'
  $use_syslog = '1'
  $log_notifications = '1'
  $log_service_retries = '1'
  $log_host_retries = '1'
  $log_event_handlers = '1'
  $log_initial_states = '0'
  $log_external_commands = '1'
  $log_passive_checks = '1'
  $global_host_event_handler = undef
  $global_service_event_handler = undef
  $service_inter_check_delay_method = 's'
  $max_service_check_spread = '30'
  $service_interleave_factor = 's'
  $host_inter_check_delay_method = 's'
  $max_host_check_spread = '30'
  $max_concurrent_checks = '0'
  $check_result_reaper_frequency = '10'
  $max_check_result_reaper_time = '30'
  $max_check_result_file_age = '3600'
  $cached_host_check_horizon = '15'
  $cached_service_check_horizon = '15'
  $enable_predictive_host_dependency_checks = '1'
  $enable_predictive_service_dependency_checks = '1'
  $soft_state_dependencies = '0'
  $time_change_threshold = undef
  $auto_reschedule_checks = '0'
  $auto_rescheduling_interval = '30'
  $auto_rescheduling_window = '180'
  $sleep_time = '0.25'
  $service_check_timeout = '60'
  $host_check_timeout = '30'
  $event_handler_timeout = '30'
  $notification_timeout = '30'
  $ocsp_timeout = '5'
  $perfdata_timeout = '5'
  $retain_state_information = '1'
  $retention_update_interval = '60'
  $use_retained_program_state = '1'
  $use_retained_scheduling_info = '1'
  $retained_host_attribute_mask = '0'
  $retained_service_attribute_mask = '0'
  $retained_process_host_attribute_mask = '0'
  $retained_process_service_attribute_mask = '0'
  $retained_contact_host_attribute_mask = '0'
  $retained_contact_service_attribute_mask = '0'
  $interval_length = '60'
  $check_for_updates = '1'
  $bare_update_check = '0'
  $use_aggressive_host_checking = '0'
  $execute_service_checks = '1'
  $accept_passive_service_checks = '1'
  $execute_host_checks = '1'
  $accept_passive_host_checks = '1'
  $enable_notifications = '1'
  $enable_event_handlers = '1'
  $process_performance_data = '0'
  $host_perfdata_command = undef
  $service_perfdata_command = undef
  $host_perfdata_file = undef
  $service_perfdata_file = undef
  $host_perfdata_file_template = undef
  $service_perfdata_file_template = undef
  $host_perfdata_file_mode = undef
  $service_perfdata_file_mode = undef
  $host_perfdata_file_processing_interval = undef
  $service_perfdata_file_processing_interval = undef
  $host_perfdata_file_processing_command = undef
  $service_perfdata_file_processing_command = undef
  $host_perfdata_process_empty_results = undef
  $service_perfdata_process_empty_results = undef
  $obsess_over_services = '0'
  $ocsp_command = undef
  $obsess_over_hosts = '0'
  $ochp_command = undef
  $ochp_timeout = undef
  $translate_passive_host_checks = '0'
  $passive_host_checks_are_soft = '0'
  $check_for_orphaned_services = '1'
  $check_for_orphaned_hosts = '1'
  $check_service_freshness = '1'
  $service_freshness_check_interval = '60'
  $service_check_timeout_state = 'c'
  $check_host_freshness = '0'
  $host_freshness_check_interval = '60'
  $additional_freshness_latency = '15'
  $enable_flap_detection = '1'
  $low_service_flap_threshold = '5.0'
  $high_service_flap_threshold = '20.0'
  $low_host_flap_threshold = '5.0'
  $high_host_flap_threshold = '20.0'
  $use_timezone = undef
  $enable_embedded_perl = '1'
  $use_embedded_perl_implicitly = '1'
  $illegal_object_name_chars = '`~!$%^&*|\'"<>?,()='
  $illegal_macro_output_chars = '`~$&|\'"<>'
  $use_regexp_matching = '0'
  $use_true_regexp_matching = '0'
  $admin_email = 'nagios@localhost'
  $admin_pager = 'pagenagios@localhost'
  $daemon_dumps_core = '0'
  $use_large_installation_tweaks = '0'
  $enable_environment_macros = '1'
  $free_child_process_memory = undef
  $child_processes_fork_twice = undef
  $debug_level = '0'
  $debug_verbosity = '1'
  $max_debug_file_size = '1000000'
  $allow_empty_hostgroup_assignment = undef

  case $::operatingsystem {
    'Debian': {
      $package_name = 'nagios3'
      $service_name = 'nagios3'
      $cgi_config_file = '/etc/nagios3/cgi.cfg'
      $reload_command = "/usr/sbin/service ${service_name} reload"

      # cgi.cfg options
      $main_config_file = '/etc/nagios3/nagios.cfg'
      $physical_html_path = '/usr/share/nagios3/htdocs'
      $url_html_path = '/nagios3'
      $show_context_help = '1'
      $nagios_check_command = "/usr/lib/nagios/plugins/check_nagios /var/cache/nagios3/status.dat 5 '/usr/sbin/nagios3'"

      # nagios.cfg options
      $log_file = '/var/log/nagios3/nagios.log'
      $cfg_dir = '/etc/nagios3/conf.d'
      $object_cache_file = '/var/cache/nagios3/objects.cache'
      $precached_object_file = '/var/lib/nagios3/objects.precache'
      $resource_file = '/etc/nagios3/resource.cfg'
      $status_file = '/var/cache/nagios3/status.dat'
      $command_file = '/var/lib/nagios3/rw/nagios.cmd'
      $lock_file = '/var/run/nagios3/nagios3.pid'
      $temp_file = '/var/cache/nagios3/nagios.tmp'
      $log_archive_path = '/var/log/nagios3/archives'
      $check_result_path = '/var/lib/nagios3/spool/checkresults'
      $state_retention_file = '/var/lib/nagios3/retention.dat'
      $date_format = 'iso8601'
      $p1_file = '/usr/lib/nagios3/p1.pl'
      $debug_file = '/var/log/nagios3/nagios.debug'
    }

    'CentOS': {
      if ! defined(Package['epel-release']) {
        package { 'epel-release': ensure => present }
      }
      $package_name = 'nagios'
      $service_name = 'nagios'
      $cgi_config_file = '/etc/nagios/cgi.cfg'
      $reload_command = "/usr/sbin/service ${service_name} reload"

      # cgi.cfg options
      $main_config_file = '/etc/nagios/nagios.cfg'
      $physical_html_path = '/usr/share/nagios/html'
      $url_html_path = '/nagios'
      $show_context_help = '0'
      $nagios_check_command = undef

      # nagios.cfg options
      $log_file = '/var/log/nagios/nagios.log'
      $cfg_dir = '/etc/nagios/conf.d'
      $object_cache_file = '/var/log/nagios/objects.cache'
      $precached_object_file = '/var/log/nagios/objects.precache'
      $resource_file = '/etc/nagios/private/resource.cfg'
      $status_file = '/var/log/nagios/status.dat'
      $command_file = '/var/spool/nagios/cmd/nagios.cmd'
      $lock_file = '/var/run/nagios.pid'
      $temp_file = '/var/log/nagios/nagios.tmp'
      $log_archive_path = '/var/log/nagios/archives'
      $check_result_path = '/var/log/nagios/spool/checkresults'
      $state_retention_file = '/var/log/nagios/retention.dat'
      $date_format = 'us'
      $p1_file = '/usr/sbin/p1.pl'
      $debug_file = '/var/log/nagios/nagios.debug'
    }

    default: {
      fail("Unsupported platform: colinhoglund-${module_name} currently doesn't support ${::osfamily} or ${::operatingsystem} or ${::operatingsystem} ${::operatingsystemmajrelease}")
    }
  }
}
