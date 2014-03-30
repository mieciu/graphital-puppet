class graphital::service inherits graphital { 

  # @TODO -> This is the place, where depends on deamonizing method
  #          chosen by user, proper things will be set
  #          (like running with ruby-deamonize rather than upstart)

  service{ 'graphital':
    ensure => "running",
    provider => "upstart",
  }

}
