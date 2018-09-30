# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include bootstrap::localbootstrap::people::abuxton::osx::hue
class localbootstrap::people::abuxton::osx::hue(
  my_hue = '192.168.1.21',
  ) {

  file { "${user_home}/.hue_bash_profile":
    ensure => 'file',
    mode   => '0755',
    #target => '/Users/abuxton/Dropbox/profile/dotfiles/hue_bash_profile',
    tag => 'bootstrap',
    content => '
    export HUE_KEY=pUAUbcowosjBKgE5VQTrD6kkfkfoQK1ZtN14pHl8
    export HUE_IP=192.168.1.21'
  }
  host { 'my-hue.localdomain':
  ensure       => 'present',
  host_aliases => ['my-hue'],
  ip           => $my_hue,
  target       => '/etc/hosts',
}

}
