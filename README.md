puppet-facter
=============

[![Build Status](https://travis-ci.org/tampakrap/puppet-facter.png?branch=master)](https://travis-ci.org/tampakrap/puppet-facter)
[![Puppet Forge](http://img.shields.io/puppetforge/v/tampakrap/facter.svg)](https://forge.puppetlabs.com/tampakrap/facter)

Manage facter package and create external facts under `/etc/facter/facts.d`

## Facter Package Installation

Since puppet will pull facter as dependency, this module will let you track the
installed version. Also, it will create the directory `/etc/facter/facts.d`,
where we can put [external facts](https://docs.puppetlabs.com/facter/latest/custom_facts.html#external-facts)

In order to use it, just import the facter class:

    import facter

You can specify extra options for the package installation, such as alternative
`provider` (in case you want to install it from Gem instead of distro package),
additional `install_options` or alternative `package_name`, eg:

    class { 'facter':
      package_name    => 'rubygem-facter',
      install_options => {'--no-recommends', '--from': 'third_party_repo'},
      ensure          => 'latest',
    }

(Please prefer to use [hiera](https://docs.puppetlabs.com/hiera/latest/) for
your data though)

## fact

Additionally, this module provides the `fact` type/resource, that creates
external facts:

    fact { 'environment':
      content => 'production',
      target  => 'env',
      ensure  => present,
    }

This will create a file `/etc/facter/facts.d/env.txt` containing:

    environment=production

* `content` is mandatory. It can not be empty string or whitespace.
* `target` is optional. It defaults to the name of the resource.
* `ensure` is optional. It defaults to `present`.

The `fact` provider is based on the [filemapper](https://github.com/adrienthebo/puppet-filemapper)
provider extension.
