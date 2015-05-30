# == Class: facter
#
# Install the facter package and create the /etc/facter/facts.d directory
#
# == Parameters
#
# [*package_name*]
# The facter package name
# Default: facter or platform dependent
#
# [*ensure*]
# The ensure value of the facter package
# Default: present
#
# [*provider*]
# The package provider
# Default: undef
#
# [*install_options*]
# The install_options param for the package provider
# Default: undef
#
# [*purge_unmanaged*]
# Whether to purge all unmanaged external facts from /etc/facter/facts.d
# Default: false
#
# [*owner*]
# The owner of the /etc/facter and facts.d directories
# Default: undef
#
# [*group*]
# The group of the /etc/facter and facts.d directories
# Default: undef
#
# [*mode*]
# The mode of the /etc/facter and facts.d directories
# Default: undef
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
