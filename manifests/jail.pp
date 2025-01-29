define fail2ban::jail (
  Enum['present', 'absent'] $ensure = 'present',
  Fail2ban::Config $content = {},
) {
  fail2ban::config_file { "/etc/fail2ban/jail.d/${name}.local":
    ensure  => $ensure,
    content => $content,
  }
}
