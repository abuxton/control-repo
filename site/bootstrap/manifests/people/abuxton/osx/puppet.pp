class bootstrap::people::abuxton::osx::puppet(
  $user       = $bootstrap::people::abuxton::params::user,
  $user_home  = $bootstrap::people::abuxton::params::user_home,

  ) inherits bootstrap::people::abuxton::params {

  include resource_api::agent #required as the module is downloaded and will error on --types flag if not installed.

  file { "$user_home/.puppetlabs":
    ensure => 'directory',
  }
  file{"${user_home}/.puppetlabs/etc/code/environments":
    ensure => 'directory',
    mode => '0755',
    owner => $user,
    require => File["$user_home/.puppetlabs"],
  }
  class{'pdk':
    pdk_download_url  =>  'pm.puppet.com/cgi-bin/pdk_download.cgi?dist=osx&rel=10.12&arch=x86_64',
    pdk_version       => 'latest',
    }


}
