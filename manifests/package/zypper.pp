# Extra package installation for openSUSE Tumbleweed
class facter::package::zypper {
  package { 'rubygem-facter':
    ensure          => $facter::ensure,
    install_options => $facter::install_options,
  }
}
