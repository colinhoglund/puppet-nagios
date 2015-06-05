#
define nagios::object::timeperiod(
  $timeperiod_alias,
  $timeperiod_name  = $title,
  $ensure           = 'present',
  $exclude          = undef,
  $friday           = undef,
  $group            = undef,
  $mode             = undef,
  $monday           = undef,
  $owner            = undef,
  $provider         = undef,
  $register         = undef,
  $saturday         = undef,
  $sunday           = undef,
  $target           = undef,
  $thursday         = undef,
  $tuesday          = undef,
  $use              = undef,
  $wednesday        = undef,
){
  include nagios

  unless $target {
    $_target = $nagios::config::timeperiod_config_file
  } else {
    $_target = $target
  }

  nagios_timeperiod { $timeperiod_name:
    ensure    => $ensure,
    alias     => $timeperiod_alias,
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
    target    => $_target,
    thursday  => $thursday,
    tuesday   => $tuesday,
    use       => $use,
    wednesday => $wednesday,
    notify    => Service[$nagios::service_name],
  }
}
