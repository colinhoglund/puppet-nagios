# == Class: nagios
#
# Installs Nagios 
#
# === Examples
#
# https://github.com/colinhoglund/puppet-nagios/blob/master/examples/init.pp
#
# === Authors
#
# Colin Hoglund (colinhoglund.com)
#
# === Copyright
#
# Copyright 2015 Colin Hoglund.
#
class nagios (
  $package_manage = true,
  $package_ensure = 'present',
  $package_name     = $nagios::params::package_name,
  $service_manage = true,
  $service_enable = true,
  $service_ensure = 'running',
  $service_name     = $nagios::params::service_name,
  $cgi_config_file  = $nagios::params::cgi_config_file,
  $main_config_file = $nagios::params::main_config_file,
  $cfg_dir          = $nagios::params::cfg_dir,
  $default_objects  = true,
) inherits nagios::params {
  include nagios::install
  include nagios::config
  include nagios::service

  Class['nagios::install'] ->
  Class['nagios::config'] ~>
  Class['nagios::service']
}
