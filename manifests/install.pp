#
class nagios::install {
  if $nagios::package_manage {
    package {$nagios::package_name:
      ensure => $nagios::package_ensure;
    }
  }
}
