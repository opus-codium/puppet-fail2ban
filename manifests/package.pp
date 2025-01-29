class fail2ban::package {
  assert_private()

  package { $fail2ban::package_name:
    ensure => $fail2ban::package_ensure,
  }
}
