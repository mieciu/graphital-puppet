class graphital::params {

  $graphite_host 	= ''
  $graphite_port 	= ''
  $graphite_prefix 	= '' 
  $polling_interval	= ''

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
