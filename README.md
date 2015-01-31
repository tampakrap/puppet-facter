puppet-facter
=============

Manage facter package and create custom facts under `/etc/facter/facts.d`

Travis Test status: [![Build Status](https://travis-ci.org/tampakrap/puppet-facter.png?branch=master)](https://travis-ci.org/tampakrap/puppet-facter)

## Facter Package Installation

Since puppet will pull facter as dependency, this module will let you track the
installed version. Also, it will create the directory `/etc/facter/facts.d`,
where we can put [external facts](https://docs.puppetlabs.com/facter/latest/custom_facts.html#external-facts)

## fact

Additionally, this module provides the `fact`, that creates external facts:

    fact { 'environment':
      content => 'production',
      target  => 'env',
      ensure  => present,
    }
