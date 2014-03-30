class graphital::params {

  if $polling_interval == undef { $polling_interval = '30' } 

  # @TODO -> This class is only a placeholder right now 
  #          but it will deal with upstart, strange package names
  #          and other distro-specific things
  
  case $::osfamily {
    'Debian': {
      $custom_set = 'Best One'
    }
    'Ubuntu': {
      $custom_set = 'Weird since 10.04'
    }
    'CentOS': {
      $custom_set = 'Almost RHEL'
    }
    'Linux': {
      case $::operatingsystem {
        'Gentoo': {
           $custom_set = 'Fun in late 90s'
	 }
	 default: {
	   fail("OMG Please tell me WHAT IS THIS")
	 }
    }
    default: {
      fail("Currently I do not support ${::osfamily} system")
    }

}
