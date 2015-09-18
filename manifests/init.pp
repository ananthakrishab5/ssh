class ssh{
	package {'package':
		name => 'openssh*',
		ensure => 'present',
		}
	file {'/var/tmp/ssh.txt':
		ensure => 'file',
		owner => 'root',
		group => 'root',
		source => 'puppet:///modules/ssh/ssh.txt',
		require => Package['package'],
		}
	service {'sshd':
		ensure => 'running',
		enable => 'true',
		subscribe => File['/var/tmp/ssh.txt'],
		}
}
