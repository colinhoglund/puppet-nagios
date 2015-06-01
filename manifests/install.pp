#
class nagios::install {
  if $nagios::package_manage {
    package {[
      $nagios::params::package_prereq,
      $nagios::package_name]:
        ensure => present;
    }
  }
}
