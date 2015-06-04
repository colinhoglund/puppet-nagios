# Install Nagios with default configuration
include nagios

# Install Nagios without default configuration and define custom objects
class { 'nagios':
  default_objects => false,
}

nagios::object::command { 'check_ssh':
    command_line => '$USER1$/check_ssh $ARG1$ $HOSTADDRESS$',
}
