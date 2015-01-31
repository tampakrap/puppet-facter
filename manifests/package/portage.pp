class facter::package::portage (
  $keywords = undef,
  $use      = undef,
) {
  if $keywords {
    package_keywords { 'facter':
      keywords => $keywords,
      target   => 'puppet',
      before   => Package[$facter::package_name],
    }
  }

  if $use {
    package_use { 'facter':
      use    => $use,
      target => 'puppet',
      before => Package[$facter::package_name],
    }
  }
}
