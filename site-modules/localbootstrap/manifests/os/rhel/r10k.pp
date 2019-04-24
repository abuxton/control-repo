# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include bootstrap::os::rhel::r10k
class bootstrap::os::rhel::r10k {
  package {'r10k':
    ensure   => present,
    provider => 'gem',
  }
  file{'/etc/r10k':
    ensure => 'directory',
    mode   => '0755',
    owner  => 'root',
    group  => 'wheel',
  }
  file { '/etc/r10k/r10k.yaml':
    ensure  => 'file',
    content => 'puppet:///modules/localbootstrap/r10k.yaml',
    mode    => '0644',
    owner   => 'root',
    group  =>  'wheel',
    }
}
