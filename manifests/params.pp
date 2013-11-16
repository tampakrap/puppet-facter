class facter::params {

  $install_options           = undef

  # Gentoo specific
  $gentoo_keywords           = undef
  $deepmerge_gentoo_keywords = undef

  case $::osfamily {
    'debian': {}
    'gentoo': {
      $pkgname           = 'dev-ruby/facter'
      $provider          = 'portage'
    }
    'redhat': {}
    'suse': {}
    'default': { fail("$::osfamily is not supported") }
  }

