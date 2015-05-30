# PRIVATE CLASS. Default params
class facter::params {
  case $::osfamily {
    'gentoo': { $package_name = 'dev-ruby/facter' }
    default : { $package_name = 'facter' }
  }
}
