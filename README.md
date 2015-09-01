# puppet-nagios

WORK IN PROGRESS...

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with nagios](#setup)
    * [What nagios affects](#what-nagios-affects)
    * [Setup requirements](#setup-requirements)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Installs and configures Nagios

## Module Description

This module automates the installation and configuration of the
core Nagios program. It is intended to be used in conjunction with modules
that manage a web server (Apache/nginx) and remote plugin execution (NRPE).

## Setup

### What nagios affects

* package/service/configuration files related to Nagios
* Nagios object definitions

### Setup Requirements

Although Nagios can run standalone, it is much more useful with a
web server (Apache/nginx/etc...) configured to serve Nagios' web frontend.

## Usage

Install Nagios with default object definitions:
```puppet
include nagios
```

Install Nagios without default configuration and define custom objects:
```puppet
class { 'nagios':
  default_objects => false,
}

nagios::object::command { 'check_ssh':
    command_line => '$USER1$/check_ssh $ARG1$ $HOSTADDRESS$',
}
#etc...
```
Note: The Nagios service will fail to start when installing with
      'default_objects => false' until all object resources have been defined.
## Reference

###Classes
* nagios

###Defined Types
* nagios::object::command
* nagios::object::contact
* nagios::object::contactgroup
* nagios::object::host
* nagios::object::hostdependency
* nagios::object::hostescalation
* nagios::object::hostgroup
* nagios::object::service
* nagios::object::servicedependency
* nagios::object::serviceescalation
* nagios::object::servicegroup
* nagios::object::timeperiod

## Limitations

###OS Compatibility
* CentOS
* Debian
* ...more to come

## Development

### Release Notes/Contributors/Etc

This module is in its early stages and will likely go though many revisions.

### Planned Updates
* ...

### Contributing
The idea behind this module is to simply install/configure the Nagios service. It was
a conscious decision to leave out "addons" such as NRPE. Any functionality
that doesn't directly affect the running state of the Nagios daemon belongs
in its own module.
