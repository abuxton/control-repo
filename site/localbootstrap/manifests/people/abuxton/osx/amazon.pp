# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include localbootstrap::people::abuxton::osx::amazon
class localbootstrap::people::abuxton::osx::amazon (
  $user       = $localbootstrap::people::abuxton::params::user,
  $user_home  = $localbootstrap::people::abuxton::params::user_home,
  ) inherits localbootstrap::people::abuxton::params {
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
