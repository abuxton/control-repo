# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include localbootstrap::people::abuxton::osx::hue
class localbootstrap::people::abuxton::osx::hue(
    $my_hue = '192.168.1.21',
    $my_hue_key = 'wjAhNpeyJCJwsFEHUUkU7GUvk1M5D-Mwa0sEO9Tp' ,
  ) inherits localbootstrap::people::abuxton::params{


  file { "${user_home}/.hue_bash_profile":
    ensure => 'file',
    mode   => '0755',
    #target => '/Users/abuxton/Dropbox/profile/dotfiles/hue_bash_profile',
    tag => 'bootstrap',
    content => "
    export HUE_KEY=$my_hue_key
    export HUE_IP=$my_hue
    "
  }
  host { 'my-hue.localdomain':
  ensure       => 'present',
  host_aliases => ['my-hue'],
  ip           => $my_hue,
  target       => '/etc/hosts',
}
file_line { 'source hue_bash_profile':
   path => "${user_home}/.bash_profile",
   line => 'source ~/.hue_bash_profile',
}

}
