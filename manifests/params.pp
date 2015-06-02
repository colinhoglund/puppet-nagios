#
class nagios::params {

  $package_manage = true
  $package_ensure = 'present'

  case $operatingsystem {
    'Debian': {
      $package_prereq = []
      $package_name = 'nagios3'
    }

    'CentOS': {
      $package_prereq  = ['epel-release']
      $package_name = 'nagios'
    }

    default: {
      fail("Unsupported platform: colinhoglund-${module_name} currently doesn't support ${::osfamily} or ${::operatingsystem} or ${::operatingsystem} ${::operatingsystemmajrelease}")
    }
  }
}
