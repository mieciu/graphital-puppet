class graphital::service inherits graphital { 

  service{ 'graphital':
    ensure => "running",
    provider => "upstart",
  }

}
