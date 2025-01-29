define fail2ban::filter (
  Enum['present', 'absent'] $ensure = 'present',
  Array[String[1]] $failregex   = [],
  Array[String[1]] $ignoreregex = [],
) {
  fail2ban::config_file { "/etc/fail2ban/filter.d/${name}.local":
    ensure  => $ensure,
    content => {
      'Definition' => {
        'failregex'   => $failregex.join("\n"),
        'ignoreregex' => $ignoreregex.join("\n"),
      },
    },
  }
}
