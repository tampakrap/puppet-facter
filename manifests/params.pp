class facter::params {
  case $::osfamily {
    'gentoo': { $provider = 'portage' }
    'suse': { $provider = 'zypper' }
  }
}
