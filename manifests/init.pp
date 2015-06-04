# == Class: nagios
#
# Installs Nagios 
#
# === Examples
#
#  # Install Nagios with default configuration
#  include nagios
#
#  # Install Nagios without default configuration and define custom objects
#  class { 'nagios':
#    default_objects => false,
#  }
#
#  nagios::object::command { 'check_ssh':
#      command_line => '$USER1$/check_ssh $ARG1$ $HOSTADDRESS$',
#  }
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
  $package_manage   = $nagios::params::package_manage,
  $package_ensure   = $nagios::params::package_ensure,
  $package_name     = $nagios::params::package_name,
  $service_manage   = $nagios::params::service_manage,
  $service_enable   = $nagios::params::service_enable,
  $service_ensure   = $nagios::params::service_ensure,
  $service_name     = $nagios::params::service_name,
  $cgi_config_file  = $nagios::params::cgi_config_file,
  $main_config_file = $nagios::params::main_config_file,
  $cfg_dir          = $nagios::params::cfg_dir,
  $default_objects  = true,
) inherits nagios::params {
  contain nagios::install
  contain nagios::config
  contain nagios::service

  Class['nagios::install'] ->
  Class['nagios::config'] ~>
  Class['nagios::service']
}
