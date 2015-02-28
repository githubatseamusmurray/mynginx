# == Class: mynginx
#
# This is test class/module... not to be used for production
#
# === Parameters
#
# None
#
# === Variables
# 
# None
#
# === Examples
#
#  class { 'mynginx': }
#
# === Limitations
#
#  This module is known to work with the following operating system families:
#
#    RedHat 5, 6
#    Debian 6.0.7 or newer
#    Ubuntu 12.04 or newer
#    
#   This module does not open up inbound access to tcp port 3000 on the local firewall
#
# === Authors
#
# Seamus Murray puppetforge@seamusmurray.com
#
# === Copyright
#
# None 
#
class mynginx {
  include nginx


  file { '/var/www':
    ensure => 'directory',
    mode   => '0644',
    owner  => "${nginx::params::daemon_user}",
    group  => "${nginx::params::root_group}",
    before => File['/var/www/exercise-webpage'],
  }
  
  file { '/var/www/exercise-webpage':
    ensure => 'directory',
    owner  => "${nginx::params::daemon_user}",
    group  => "${nginx::params::root_group}",
    mode   => '0644',
  }

  nginx::resource::vhost { 'exercise-webpage':
    www_root    => '/var/www/exercise-webpage',
    listen_port => 3000,
  }

  notice ( " nginx daemon_user is set to ${nginx::params::daemon_user} for osfamily of ${::osfamily} ")
  notice ( " nginx package name is set to ${nginx::params::package_name} for osfamily of ${::osfamily} ")

  package { 'git':
    ensure => 'present',
  }

  exec { 'git-clone':
    path    => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ],
    command => "git clone https://github.com/puppetlabs/exercise-webpage /var/www/exercise-webpage",
    require => [Package['git'],File['/var/www/exercise-webpage']],
    creates => "/var/www/exercise-webpage/index.html",
  }

  exec { 'git-fetch':
    path    => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ],
    cwd     => "/var/www/exercise-webpage",
    command => "git checkout master -f",
    require => [Package['git'],File['/var/www/exercise-webpage']],
    onlyif  => "test -f /var/www/exercise-webpage/index.html",
  }
 

}

