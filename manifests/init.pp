# Installs virtualenv
#
# Usage:
#
#   include virtualenv
class virtualenv {

    exec { 'easy_install':
        user => root,
        command => "easy_install pip",
    }

    package { 'virtualenv':
        provider => 'pip',
        source   => 'virtualenv',
        require => Exec['easy_install'],
    }

    package { 'virtualenvwrapper':
        provider => 'pip',
        source   => 'virtualenvwrapper',
        require => Package['virtualenv'],
    }

    file {'/usr/local':
        owner => root,
        group => wheel,
        mode => 755,
        ensure => directory,
    }

    file {'/usr/local/bin':
        owner => root,
        group => wheel,
        mode => 755,
        ensure => directory,
        require => File['/usr/local'],
    }
}

