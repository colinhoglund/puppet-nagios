#
class nagios::install (
  $ensure  = present,
  $prereq  = nagios::params::prereq,
  $package = nagios::params::package,
){
  package {[
    $prereq,
    $package]:
      ensure => $ensure;
  }
}
