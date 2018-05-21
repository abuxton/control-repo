class bootstrap::people::abuxton::osx::puppet(
  $user       = $bootstrap::people::abuxton::params::user,
  $user_home  = $bootstrap::people::abuxton::params::user_home,

  ) inherits bootstrap::people::abuxton::params {
  file{"${user_home}/.puppetlabs/etc/code/environments":
    ensure => 'directory',
    mode => '0755',
    owner => $user,
  }

}
