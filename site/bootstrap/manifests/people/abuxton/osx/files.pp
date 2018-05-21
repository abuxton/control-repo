class bootstrap::people::abuxton::osx::files(
  $user       = $bootstrap::people::abuxton::params::user,
  $user_home  = $bootstrap::people::abuxton::params::user_home,

  ) inherits bootstrap::people::abuxton::params {
  file { "${user_home}/.atom":
    ensure => 'link',
    mode   => '0755',
    target => "${user_home}/Dropbox/profile/dotfiles/atom",
    force => true,
    #type   => 'link',
  }
  file { "${user_home}/.bash_profile":
    ensure => 'link',
    mode   => '0755',
    target => '/Users/abuxton/Dropbox/profile/dotfiles/bash_profile',
    #type   => 'link',
  }
  file { "${user_home}/.bashrc":
    ensure => 'link',
    mode   => '0755',
    target => '/Users/abuxton/Dropbox/profile/dotfiles/bashrc',
  }
  file { "${user_home}/.eyaml":
    ensure => 'link',
    mode   => '0755',
    target => '/Users/abuxton/Dropbox/profile/dotfiles/eyaml',
  }
  file { "${user_home}/.gitconfig":
    ensure => 'link',
    mode   => '0755',
    target => '/Users/abuxton/Dropbox/profile/dotfiles/bck.gitconfig',
  }
  file { "${user_home}/.puppetforge.yml":
    ensure => 'link',
    mode   => '0755',
    target => '/Users/abuxton/Dropbox/profile/dotfiles/puppetforge.yml',
  }
  file { "${user_home}/.ssh":
    ensure => 'link',
    mode   => '0755',
    target => '/Users/abuxton/Dropbox/profile/dotfiles/ssh',
  }
  file { "${user_home}/.tmux.conf":
    ensure => 'link',
    mode   => '0755',
    target => '/Users/abuxton/.dotfiles/tmux.conf',
  }
file { "${user_home}/.profile":
  ensure  => 'file',
  content => '{md5}d41d8cd98f00b204e9800998ecf8427e',
  mode    => '0644',
  #type    => 'file',
 }
}
