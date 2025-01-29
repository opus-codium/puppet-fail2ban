define fail2ban::action (
  Enum['present', 'absent'] $ensure  = 'present',
  Stdlib::Filemode          $mode    = '0644',
  Fail2ban::Config          $content = {},
) {
  fail2ban::config_file { "/etc/fail2ban/action.d/${name}.local":
    ensure  => $ensure,
    mode    => $mode,
    content => $content,
  }
}
