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
# Przemek Hejman <przemyslaw.hejman@gmail.com>
#
# === Copyright
#
# Copyright 2014 Przemek Hejman.
#
class graphital ( 
  $graphite_server	= $graphital::params::graphite_server, 
  $graphite_port	= $graphital::params::graphite_port, 
  $graphite_prefix	= $graphital::params::graphite_prefix, 
  $polling_interval	= $graphital::params::polling_interval, 
) inherits graphital::params {

  ## @TODO
  # puppet stdlib validate (stings, validate_re for graphite prefix)

  anchor { 'graphital::begin': } ->
  class { '::graphital::install': } ->
  class { '::graphital::config': } ~>
  class { '::graphital::service': } ->
  anchor { 'graphital::end': }

}
