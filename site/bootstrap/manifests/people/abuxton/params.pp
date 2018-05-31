class bootstrap::people::abuxton::params{
case $osfamily {
  'Darwin': {
    $user = 'abuxton'
    $user_home = "/Users/${user}"
    }
  default{
    fail('Unsupported OS for user!')
    }
  }
}
