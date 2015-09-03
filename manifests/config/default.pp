#
class nagios::config::default {
  require nagios::config

  nagios::object::command {
    'notify-host-by-email':
      command_line => '/usr/bin/printf "%b" "***** Nagios *****\n\nNotification Type: $NOTIFICATIONTYPE$\nHost: $HOSTNAME$\nState: $HOSTSTATE$\nAddress: $HOSTADDRESS$\nInfo: $HOSTOUTPUT$\n\nDate/Time: $LONGDATETIME$\n" | /usr/bin/mail -s "** $NOTIFICATIONTYPE$ Host Alert: $HOSTNAME$ is $HOSTSTATE$ **" $CONTACTEMAIL$';
    'notify-service-by-email':
      command_line => '/usr/bin/printf "%b" "***** Nagios *****\n\nNotification Type: $NOTIFICATIONTYPE$\n\nService: $SERVICEDESC$\nHost: $HOSTALIAS$\nAddress: $HOSTADDRESS$\nState: $SERVICESTATE$\n\nDate/Time: $LONGDATETIME$\n\nAdditional Info:\n\n$SERVICEOUTPUT$\n" | /usr/bin/mail -s "** $NOTIFICATIONTYPE$ Service Alert: $HOSTALIAS$/$SERVICEDESC$ is $SERVICESTATE$ **" $CONTACTEMAIL$';
    'check-host-alive':
      command_line => '$USER1$/check_ping -H $HOSTADDRESS$ -w 3000.0,80% -c 5000.0,100% -p 5';
    'check_local_disk':
      command_line => '$USER1$/check_disk -w $ARG1$ -c $ARG2$ -p $ARG3$';
    'check_local_load':
      command_line => '$USER1$/check_load -w $ARG1$ -c $ARG2$';
    'check_local_procs':
      command_line => '$USER1$/check_procs -w $ARG1$ -c $ARG2$ -s $ARG3$';
    'check_local_users':
      command_line => '$USER1$/check_users -w $ARG1$ -c $ARG2$';
    'check_local_swap':
      command_line => '$USER1$/check_swap -w $ARG1$ -c $ARG2$';
    'check_local_mrtgtraf':
      command_line => '$USER1$/check_mrtgtraf -F $ARG1$ -a $ARG2$ -w $ARG3$ -c $ARG4$ -e $ARG5$';
    'check_ftp':
      command_line => '$USER1$/check_ftp -H $HOSTADDRESS$ $ARG1$';
    'check_hpjd':
      command_line => '$USER1$/check_hpjd -H $HOSTADDRESS$ $ARG1$';
    'check_snmp':
      command_line => '$USER1$/check_snmp -H $HOSTADDRESS$ $ARG1$';
    'check_http':
      command_line => '$USER1$/check_http -I $HOSTADDRESS$ $ARG1$';
    'check_ssh':
      command_line => '$USER1$/check_ssh $ARG1$ $HOSTADDRESS$';
    'check_dhcp':
      command_line => '$USER1$/check_dhcp $ARG1$';
    'check_ping':
      command_line => '$USER1$/check_ping -H $HOSTADDRESS$ -w $ARG1$ -c $ARG2$ -p 5';
    'check_pop':
      command_line => '$USER1$/check_pop -H $HOSTADDRESS$ $ARG1$';
    'check_imap':
      command_line => '$USER1$/check_imap -H $HOSTADDRESS$ $ARG1$';
    'check_smtp':
      command_line => '$USER1$/check_smtp -H $HOSTADDRESS$ $ARG1$';
    'check_tcp':
      command_line => '$USER1$/check_tcp -H $HOSTADDRESS$ -p $ARG1$ $ARG2$';
    'check_udp':
      command_line => '$USER1$/check_udp -H $HOSTADDRESS$ -p $ARG1$ $ARG2$';
    'check_nt':
      command_line => '$USER1$/check_nt -H $HOSTADDRESS$ -p 12489 -v $ARG1$ $ARG2$';
    'process-host-perfdata':
      command_line => '/usr/bin/printf "%b" "$LASTHOSTCHECK$\t$HOSTNAME$\t$HOSTSTATE$\t$HOSTATTEMPT$\t$HOSTSTATETYPE$\t$HOSTEXECUTIONTIME$\t$HOSTOUTPUT$\t$HOSTPERFDATA$\n" >> /var/log/nagios/host-perfdata.out';
    'process-service-perfdata':
      command_line => '/usr/bin/printf "%b" "$LASTSERVICECHECK$\t$HOSTNAME$\t$SERVICEDESC$\t$SERVICESTATE$\t$SERVICEATTEMPT$\t$SERVICESTATETYPE$\t$SERVICEEXECUTIONTIME$\t$SERVICELATENCY$\t$SERVICEOUTPUT$\t$SERVICEPERFDATA$\n" >> /var/log/nagios/service-perfdata.out';
  }

  nagios::object::contact {
    'generic-contact':
      service_notification_period   => '24x7',
      host_notification_period      => '24x7',
      service_notification_options  => 'w,u,c,r,f,s',
      host_notification_options     => 'd,u,r,f,s',
      service_notification_commands => 'notify-service-by-email',
      host_notification_commands    => 'notify-host-by-email',
      register                      => '0';
    'nagiosadmin':
      use   => 'generic-contact',
      contact_alias => 'Nagios Admin',
      email => 'nagios@localhost';
  }

  nagios::object::contactgroup { 'admins':
    contactgroup_alias => 'Nagios Administrators',
    members            => 'nagiosadmin',
  }

  nagios::object::service {
    'generic-service':
      active_checks_enabled        => '1',
      passive_checks_enabled       => '1',
      parallelize_check            => '1',
      obsess_over_service          => '1',
      check_freshness              => '0',
      notifications_enabled        => '1',
      event_handler_enabled        => '1',
      flap_detection_enabled       => '1',
      failure_prediction_enabled   => '1',
      process_perf_data            => '1',
      retain_status_information    => '1',
      retain_nonstatus_information => '1',
      is_volatile                  => '0',
      check_period                 => '24x7',
      max_check_attempts           => '3',
      normal_check_interval        => '10',
      retry_check_interval         => '2',
      contact_groups               => 'admins',
      notification_options         => 'w,u,c,r',
      notification_interval        => '60',
      notification_period          => '24x7',
      register                     => '0';
    'http-service':
      use                   => 'generic-service',
      host_name             => 'localhost',
      service_description   => 'HTTP',
      check_command         => 'check_http',
      notifications_enabled => '0';
  }

  nagios::object::host {
    'generic-host':
      check_command                => 'check-host-alive',
      max_check_attempts           => '10',
      notifications_enabled        => '1',
      event_handler_enabled        => '1',
      flap_detection_enabled       => '1',
      failure_prediction_enabled   => '1',
      process_perf_data            => '1',
      retain_status_information    => '1',
      retain_nonstatus_information => '1',
      notification_period          => '24x7',
      register                     => '0';
    'localhost':
      use      => 'generic-host',
      alias    => 'localhost',
      address  => '127.0.0.1',
      contacts => 'nagiosadmin';
  }

  nagios::object::timeperiod {
    '24x7':
      timeperiod_alias => '24 Hours A Day, 7 Days A Week',
      sunday           => '00:00-24:00',
      monday           => '00:00-24:00',
      tuesday          => '00:00-24:00',
      wednesday        => '00:00-24:00',
      thursday         => '00:00-24:00',
      friday           => '00:00-24:00',
      saturday         => '00:00-24:00';
    'workhours':
      timeperiod_alias => 'Normal Work Hours',
      monday           => '09:00-17:00',
      tuesday          => '09:00-17:00',
      wednesday        => '09:00-17:00',
      thursday         => '09:00-17:00',
      friday           => '09:00-17:00';
    'none':
      timeperiod_alias => 'No Time Is A Good Time';
#    'us-holidays':
#      alias                   U.S. Holidays
#      january 1               00:00-00:00     ; New Years
#      monday -1 may           00:00-00:00     ; Memorial Day (last Monday in May)
#      july 4                  00:00-00:00     ; Independence Day
#      monday 1 september      00:00-00:00     ; Labor Day (first Monday in September)
#      thursday 4 november     00:00-00:00     ; Thanksgiving (4th Thursday in November)
#      december 25             00:00-00:00     ; Christmas
#    '24x7_sans_holidays':
#      alias           24x7 Sans Holidays
#      use   us-holidays   ; Get holiday exceptions from other timeperiod
#      sunday          00:00-24:00
#      monday          00:00-24:00
#      tuesday         00:00-24:00
#      wednesday       00:00-24:00
#      thursday        00:00-24:00
#      friday          00:00-24:00
#      saturday        00:00-24:00
  }
}
