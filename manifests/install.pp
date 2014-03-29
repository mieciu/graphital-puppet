class graphital::install inherits graphital {

  $package_dependencies = [ 'git', 'sysstat', 'ruby' ]
  
  package { $package_dependencies: 
    ensure => 'installed' 
  }
  ->
  vcsrepo { "/opt/graphital/":
    ensure => present,
    provider => git,
    source => "git://github.com/rashidkpc/graphital.git"
  }
      

}
