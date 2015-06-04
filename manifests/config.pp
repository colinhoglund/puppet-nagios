#
class nagios::config (
  $command_config_file           = "${nagios::cfg_dir}/commands.cfg",
  $contact_config_file           = "${nagios::cfg_dir}/contacts.cfg",
  $contactgroup_config_file      = "${nagios::cfg_dir}/contactgroups.cfg",
  $host_config_file              = "${nagios::cfg_dir}/hosts.cfg",
  $hostdependency_config_file    = "${nagios::cfg_dir}/hostdependencys.cfg",
  $hostescalation_config_file    = "${nagios::cfg_dir}/hostescalations.cfg",
  $hostgroup_config_file         = "${nagios::cfg_dir}/hostgroups.cfg",
  $service_config_file           = "${nagios::cfg_dir}/services.cfg",
  $servicedependency_config_file = "${nagios::cfg_dir}/servicedependencys.cfg",
  $serviceescalation_config_file = "${nagios::cfg_dir}/serviceescalations.cfg",
  $servicegroup_config_file      = "${nagios::cfg_dir}/servicegroups.cfg",
  $timeperiod_config_file        = "${nagios::cfg_dir}/timeperiods.cfg",
){
  contain nagios::config::main
  contain nagios::config::cgi

  file {
    $nagios::cfg_dir:
      ensure  => directory,
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      recurse => true,
      purge   => true;
    [$command_config_file,
    $contact_config_file,
    $contactgroup_config_file,
    $host_config_file,
    $hostdependency_config_file,
    $hostescalation_config_file,
    $hostgroup_config_file,
    $service_config_file,
    $servicedependency_config_file,
    $serviceescalation_config_file,
    $servicegroup_config_file,
    $timeperiod_config_file]:
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0644'
  }

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
    'nagiosadmin':
      use   => 'generic-contact',
      contact_alias => 'Nagios Admin',
      email => 'nagios@localhost';
  }
}
