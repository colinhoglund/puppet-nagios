#
define nagios::object::timeperiod(
  $timeperiod_name = $title,
  $ensure          = 'present',
  $alias           = undef,
  $exclude         = undef,
  $friday          = undef,
  $group           = undef,
  $mode            = undef,
  $monday          = undef,
  $owner           = undef,
  $provider        = undef,
  $register        = undef,
  $saturday        = undef,
  $sunday          = undef,
  $target          = $nagios::config::timeperiod_config_file,
  $thursday        = undef,
  $tuesday         = undef,
  $use             = undef,
  $wednesday       = undef,
){
  include nagios

  nagios_timeperiod { $timeperiod_name:
    ensure    => $ensure,
    alias     => $alias,
    exclude   => $exclude,
    friday    => $friday,
    group     => $group,
    mode      => $mode,
    monday    => $monday,
    owner     => $owner,
    provider  => $provider,
    register  => $register,
    saturday  => $saturday,
    sunday    => $sunday,
    target    => $target,
    thursday  => $thursday,
    tuesday   => $tuesday,
    use       => $use,
    wednesday => $wednesday,
  }
}
