class graphital::service inherits graphital { 

  # @TODO -> This is the place, where depends on deamonizing method
  #          chosen by user, proper things will be set
  #          (like running with ruby-deamonize rather than upstart)

  case $daemonize_method {
    'daemonize': { fail("Sorry, $daemonize_method is not supported yet.") }
    'cron':      { fail("Sorry, $daemonize_method is not supported yet.") }
    default: {   # Upstart is the default method :)
      service{ 'graphital':
        ensure => "running",
        provider => "upstart",
      }
    }   
  }
}
