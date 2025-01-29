define fail2ban::config_file (
  Enum['present', 'absent'] $ensure  = 'present',
  String[1]                 $owner   = 'root',
  String[1]                 $group   = 'root',
  Stdlib::Filemode          $mode    = '0644',
  Fail2ban::Config          $content = {},
) {
  file { $title:
    ensure  => $ensure,
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    content => epp('fail2ban/config.epp', { content => $content }),
  }
}
