class graphital::service inherits graphital { 

  # @TODO -> This is the place, where depends on deamonizing method
  #          chosen by user, proper things will be set
  #          (like running with ruby-deamonize rather than upstart)

  case $daemonize_method {
    'daemonize': { fail("Sorry, ${daemonize_method} is not supported yet.") }
    'cron':      { fail("Sorry, ${daemonize_method} is not supported yet.") }
    default: {   # Upstart is the default method :)
      file { 'upstart configfile':
        path    => "/etc/init/graphital.conf",
	ensure  => file,
	owner   => 0,
	group   => 0,
	mode    => '0644',
	content => template(graphital/graphital.conf.erb),
      } ->
      service{ 'graphital':
        ensure => "running",
        provider => "upstart",
      }
    }   
  }
}
