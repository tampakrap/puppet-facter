puppet-facter
=============

Manage facter package and create custom facts under `/etc/facter/facts.d`

Travis Test status: [![Build Status](https://travis-ci.org/tampakrap/puppet-facter.png?branch=master)](https://travis-ci.org/tampakrap/puppet-facter)

## Facter Package Installation

Since puppet will pull facter as dependency, this module will let you track the
installed version. Also, it will create the directory `/etc/facter/facts.d`,
where we can put [external facts](https://docs.puppetlabs.com/facter/latest/custom_facts.html#external-facts)

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

* `content is mandatory. It can not be empty string or whitespace.
* `$target` is optional. It defaults to the name of the resource.
* `ensure` is optional. It defaults to `present`.

The `fact` provider is based on the [filemapper](https://github.com/adrienthebo/puppet-filemapper)
provider extension.
