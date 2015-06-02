#
class nagios::service {
  if $nagios::service_manage {
    service { $nagios::service_name:
      ensure     => $nagios::service_ensure,
      enable     => $nagios::service_enable,
      name       => $nagios::service_name,
      hasstatus  => true,
      hasrestart => true,
    }
  }
}
