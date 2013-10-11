# Installs virtualenv
#
# Usage:
#
#   include virtualenv
class virtualenv {

    exec { 'easy_install':
        user => root,
        command => "easy_install --upgrade pip",
    }

    package { 'virtualenv':
        provider => 'pip',
        source   => 'virtualenv',
        require => Exec['easy_install'],
        ensure => latest,
    }

    package { 'virtualenvwrapper':
        provider => 'pip',
        source   => 'virtualenvwrapper',
        require => Package['virtualenv'],
        ensure => latest,
    }

    file {'/usr/local':
        owner => root,
        group => wheel,
        mode => 755,
        ensure => directory,
        require => Package['virtualenvwrapper'],
    }

    file {'/usr/local/bin':
        owner => root,
        group => wheel,
        mode => 755,
        ensure => directory,
        require => File['/usr/local'],
    }
}

