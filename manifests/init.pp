class facter (
  $package_name    = undef,
  $ensure          = 'present',
  $provider        = $facter::params::provider,
  $install_options = undef,
) inherits facter::params {

  include facter::package

  file { '/etc/facter': ensure => 'directory' }
  ->
  file { '/etc/facter/facts.d': ensure  => 'directory' }

}
