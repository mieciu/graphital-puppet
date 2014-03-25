# Graphital-puppet

WARNING -> THIS MODULE IS STILL UNDER DEVELOPMENT & TESTING, please wait with usage until the removal of this line:)

This is my own module to deploy Graphital (https://github.com/rashidkpc/graphital) in easiest way possible.

Graphital is a very simple (~50 lines) ruby daemon for shipping system vitals 
to Graphite. It uses a `graphital.d` directory and simply runs everything in it.
Several examples are included (most require the `sar` utility from the `sysstat`
package), but its easy to write your own in your language of choice.

First, I'm working on seamless deployment of simpliest installation, providing only these params:

`
graphital{ 'gogogo':
  graphite_host => 'graphite.mydomain.com',
  graphite_port => '31337',
  graphite_prefix => 'com.mydomain.frontends.$::hostname',
  polling_interval => '30'
}
`

But in the closest future possible I would like to support various configuration files location, selection between either Upstart or daemons gem, ...

