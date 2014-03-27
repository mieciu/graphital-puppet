# == Class: graphital
#
# Full description of class graphital here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { graphital:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class graphital ( 
  $graphite_host, 
  $graphite_port, 
  $graphite_prefix, 
  $polling_interval
) {

$package_dependencies = [ "git", "sysstat", "ruby" ]
package { $package_dependencies: ensure => "installed" }
#packages as virtual resources a must!

exec { 'cloning repository':
  command => "git clone https://github.com/rashidkpc/graphital.git /opt/graphital"
} ->
package { 'daemons':
  ensure   => 'installed',
  provider => 'gem',
}
# Edit the configfile
augeas { "graphital_config":
  context => "/opt/graphital/graphital.conf",
  changes => [
    "set \$HOST $graphite_host",
    "set \$PORT $graphite_port",
    "set \$PREFIX $graphite_prefix",
    "set \$INTERVAL $polling_interval",
  ],
}
~> # run dat beast :> 
exec{ 'run daemon': 
  command => "ruby /opt/graphital/daemon.rb start",
}

}
