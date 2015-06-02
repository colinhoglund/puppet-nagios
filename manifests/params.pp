#
class nagios::params {

  $package_manage = true
  $package_ensure = 'present'

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

  case $operatingsystem {
    'Debian': {
      $package_prereq = []
      $package_name = 'nagios3'
      $main_config_file = '/etc/nagios3/nagios.cfg'
      $physical_html_path = '/usr/share/nagios3/htdocs'
      $url_html_path = '/nagios3'
      $show_context_help = '1'
      $nagios_check_command = "/usr/lib/nagios/plugins/check_nagios /var/cache/nagios3/status.dat 5 '/usr/sbin/nagios3'"
    }

    'CentOS': {
      $package_prereq  = ['epel-release']
      $package_name = 'nagios'
      $main_config_file = '/etc/nagios/nagios.cfg'
      $physical_html_path = '/usr/share/nagios/html'
      $url_html_path = '/nagios'
      $show_context_help = '0'
      $nagios_check_command = undef
    }

    default: {
      fail("Unsupported platform: colinhoglund-${module_name} currently doesn't support ${::osfamily} or ${::operatingsystem} or ${::operatingsystem} ${::operatingsystemmajrelease}")
    }
  }
}
