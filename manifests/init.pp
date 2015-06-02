# == Class: nagios
#
# Full description of class nagios here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'nagios':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class nagios (
  $package_manage   = $nagios::params::package_manage,
  $package_ensure   = $nagios::params::package_ensure,
  $package_name     = $nagios::params::package_name,
  $cgi_config_file  = $nagios::params::cgi_config_file,
  $main_config_file = $nagios::params::main_config_file,
) inherits nagios::params {
  contain nagios::install
  contain nagios::config
  contain nagios::service

  Class['nagios::install'] ->
  Class['nagios::config'] ~>
  Class['nagios::service']
}
