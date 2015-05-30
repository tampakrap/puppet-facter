# == Class: facter
#
# Install the facter package and create the /etc/facter/facts.d directory
#
# == Example:
#
# class { 'facter'
#   package_name => 'facter',
#   provider     => 'gem',
#   ensure       => 'latest',
# }
#
class facter (
  $package_name    = $facter::params::package_name,
  $ensure          = 'present',
  $provider        = undef,
  $install_options = undef,
  $purge_unmanaged = false,
  $owner           = undef,
  $group           = undef,
  $mode            = undef,
) inherits facter::params {

  validate_bool($purge_unmanaged)

  include facter::package

  file { '/etc/facter':
    ensure => 'directory',
    owner  => $owner,
    group  => $group,
    mode   => $mode,
  }
  ->
  file { '/etc/facter/facts.d':
    ensure => 'directory',
    owner  => $owner,
    group  => $group,
    mode   => $mode,
  }

  resources { 'fact': purge => $purge_unmanaged }
}
