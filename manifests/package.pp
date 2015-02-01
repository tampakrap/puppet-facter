# This class should not be required directly
class facter::package {
  if $facter::package_name {
    $package_name = $facter::package_name
  } elsif $facter::provider == 'zypper' and $::operatingsystemrelease > '13.2' {
    $package_name = 'ruby2.1-rubygem-facter'
    include facter::package::zypper
  } elsif $facter::provider == 'portage' {
    $package_name = 'dev-ruby/facter'
    include facter::package::portage
  } else {
    $package_name = 'facter'
  }

  package { $package_name:
    ensure          => $facter::ensure,
    provider        => $facter::provider,
    install_options => $facter::install_options,
  }
}
