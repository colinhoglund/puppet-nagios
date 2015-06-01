#
class nagios::params {
  case $operatingsystem {
    'Debian': {
      $prereq = []
      $package = 'nagios3'
    }

    'CentOS': {
      $prereq  = ['epel-release']
      $package = 'nagios'
    }

    default: {
      fail("Unsupported platform: colinhoglund-${module_name} currently doesn't support ${::osfamily} or ${::operatingsystem}")
    }
  }
}
