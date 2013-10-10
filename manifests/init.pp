# Installs virtualenv
#
# Usage:
#
#   include virtualenv
class virtualenv {

  exec { 'easy_install':
    command => "sudo easy_install pip",
    }

  package { 'virtualenv':
    provider => 'pip',
    source   => 'virtualenv',
    require => Exec['easy_install'],
  }
}

