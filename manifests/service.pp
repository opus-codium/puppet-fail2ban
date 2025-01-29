class fail2ban::service {
  assert_private()

  service { $fail2ban::service_name:
    ensure => $fail2ban::service_ensure,
    enable => $fail2ban::service_enable,
  }
}
