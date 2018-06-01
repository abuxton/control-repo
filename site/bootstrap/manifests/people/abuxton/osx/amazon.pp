# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include bootstrap::people::abuxton::osx::amazon
class bootstrap::people::abuxton::osx::amazon (
  $user       = $bootstrap::people::abuxton::params::user,
  $user_home  = $bootstrap::people::abuxton::params::user_home,
  ) inherits bootstrap::people::abuxton::params {
  package { 'retries':
      ensure   => 'present',
      provider => 'puppet_gem'
    }
    package { 'aws-sdk':
        ensure   => 'present',
        provider => 'puppet_gem'
      }
    file { '/Users/abuxton/.aws':
  ensure => 'link',
  mode   => '0755',
  owner  => 'abuxton',
  target => '/Users/abuxton/Dropbox/profile/dotfiles/aws',
}

}
