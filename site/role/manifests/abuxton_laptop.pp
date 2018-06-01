class role::abuxton_laptop{
  case $hostname: {
    'home-abuxton-mba': {
      include profile::abuxton::osx_base
      include profile::abuxton::osx_puppet
    }
    '^puppet':{
      include profile::abuxton::osx_base
      include profile::abuxton::osx_puppet
    }
  }

}
