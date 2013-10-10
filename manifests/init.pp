# Installs virtualenv
#
# Usage:
#
#   include virtualenv
class virtualenv {
  package { 'virtualenv':
    provider => 'pip',
    source   => 'virtualenv
  }
}

