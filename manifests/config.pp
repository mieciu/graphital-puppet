class graphital::config inherits graphital {

  augeas { "graphital_config":
    context => "/opt/graphital/graphital.conf",
    changes => [
      "set \$HOST $graphite_host",
      "set \$PORT $graphite_port",
      "set \$PREFIX $graphite_prefix",
      "set \$INTERVAL $polling_interval",
    ],
  }
  ->
  file { 'upstart configfile':
    path    => "/etc/init/graphital.conf",
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template(graphital/graphital.conf.erb),
  }
  

}
