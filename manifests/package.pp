class facter::package {

  include facter

  if $facter::provider == 'portage' {
    portage::package { $facter::pkgname:
      keywords => $facter::gentoo_keywords,
      use      => $facter::gentoo_use,
      ensure   => $facter::ensure,
    }
  } else {
    package { $facter::pkgname:
      ensure          => $facter::ensure,
      provider        => $facter::provider,
      install_options => $facter::install_options,
    }
  }

}
