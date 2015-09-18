class ssh{
	package {'package':
		name => 'openssh-clients',
		ensure => 'present',
		}
	file {'/var/tmp/ssh.txt':
		ensure => 'file',
		owner => 'kittu',
		group => 'kittu',
		source => 'puppet:///modules/ssh/ssh.txt',
		require => Package['package'],
		}
	service {'sshd':
		ensure => 'running',
		enable => 'true',
		subscribe => File['/var/tmp/ssh.txt'],
		}
}
