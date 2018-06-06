#
class bootstrap::people::abuxton::osx::r10k(
  $user       = $bootstrap::people::abuxton::params::user,
  $user_home  = $bootstrap::people::abuxton::params::user_home,
  ) inherits bootstrap::people::abuxton::params {
package {'r10k':
  ensure   => present,
  provider => 'gem',
}
file{"${user_home}/.puppetlabs/etc/puppet/r10k":
  ensure => 'directory',
  mode   => '0755',
  owner  => 'abuxton',
}
file { "${user_home}/.puppetlabs/etc/puppet/r10k/r10k.yaml":
  ensure  => 'file',
  content => 'puppet:///modules/bootstrap/abuxton_r10k.yaml',
  mode    => '0644',
  owner   => 'abuxton',
  }

}
