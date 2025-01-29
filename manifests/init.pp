class fail2ban (
  String[1] $package_name   = 'fail2ban',
  String[1] $package_ensure = 'installed',
  String[1] $service_name   = 'fail2ban',
  String[1] $service_ensure = 'running',
  Boolean   $service_enable = true,
) {
  contain fail2ban::package
  contain fail2ban::config
  contain fail2ban::service

  Class['fail2ban::package'] -> Class['fail2ban::config'] ~> Class['fail2ban::service']
}
