#
class nagios::params {
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
      if !defined(Package[epel-release]) and !defined(Yumrepo[epel]) {
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
