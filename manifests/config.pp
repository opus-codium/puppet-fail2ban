class fail2ban::config {
  assert_private()

  fail2ban::config_file { '/etc/fail2ban/fail2ban.local':
    content => {},
  }

  fail2ban::config_file { '/etc/fail2ban/jail.local':
    content => {},
  }
}
