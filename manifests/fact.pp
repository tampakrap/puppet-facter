define facter::fact (
  $ensure = 'present',
  $value,
) {

  file { "/etc/facter/facts.d/${name}.txt":
    ensure  => $ensure,
    content => "${name}=${value}\n",
    require => File['/etc/facter/facts.d'],
  }

}
