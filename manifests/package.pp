# PRIVATE CLASS
class facter::package {
  if $facter::provider == 'portage' {
    include facter::package::portage
  }

  package { $facter::package_name:
    ensure          => $facter::ensure,
    provider        => $facter::provider,
    install_options => $facter::install_options,
  }
}
