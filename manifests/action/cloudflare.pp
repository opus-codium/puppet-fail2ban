class fail2ban::action::cloudflare (
  Stdlib::Email             $user,
  Sensitive[String[1]]      $token,
  Enum['present', 'absent'] $ensure = 'present',
  Optional[String[1]]       $action = undef,
) {
  fail2ban::action { 'cloudflare':
    ensure  => $ensure,
    mode    => '0640',
    content => {
      'Init' => {
        action  => $action,
        cfuser  => $user,
        cftoken => $token,
      },
    },
  }
}
