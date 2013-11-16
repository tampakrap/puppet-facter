class facter::params {

  $install_options = undef

  # Gentoo specific
  $gentoo_keywords = undef
  $gentoo_use      = undef

  case $::osfamily {
    'debian': {}
    'gentoo': {
      $pkgname  = 'dev-ruby/facter'
      $provider = 'portage'
    }
    'redhat': {}
    'suse': {}
    'default': { fail("$::osfamily is not supported") }
  }

}
