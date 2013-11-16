class facter (
  $pkgname         = $facter::params::pkgname,
  $ensure          = 'present',
  $provider        = $facter::params::provider,
  $gentoo_keywords = $facter::params::gentoo_keywords,
  $gentoo_use      = $facter::params::gentoo_use,
  $install_options = $facter::params::install_options,
) inherits facter::params {

  include facter::package

  file { '/etc/facter': ensure => 'directory' }
  ->
  file { '/etc/facter/facts.d': ensure  => 'directory' }

}
