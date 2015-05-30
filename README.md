puppet-facter
=============

[![Build Status](https://travis-ci.org/tampakrap/puppet-facter.png?branch=master)](https://travis-ci.org/tampakrap/puppet-facter)
[![Puppet Forge](http://img.shields.io/puppetforge/v/tampakrap/facter.svg)](https://forge.puppetlabs.com/tampakrap/facter)

Manage facter package and create external facts under `/etc/facter/facts.d`

## Facter Package Installation

Since puppet will pull facter as dependency, this module will let you track the
installed version. Also, it will create the directory `/etc/facter/facts.d`,
where we can put [external facts](https://docs.puppetlabs.com/facter/latest/custom_facts.html#external-facts)

See [Usage](#usage) for more installation details.

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

## Usage

In order to use this module, just import the facter class:

    import facter

You can specify extra options for the package installation, such as alternative
`provider` (in case you want to install it from Gem instead of distro package),
additional `install_options` or alternative `package_name`, or alternative
permissions for the /etc/facter and facts.d directories:
    class { 'facter':
        package_name    => 'rubygem-facter',
        install_options => {'--no-recommends', '--from': 'third_party_repo'},
        ensure          => 'latest',
        owner           => 'puppet',
        group           => 'puppet',
        mode            => '0750',
    }

(Please prefer to use [hiera](https://docs.puppetlabs.com/hiera/latest/) for
your data though)

### Classes

### Public Classes

- `facter`: Main class to install facter, /etc/facter/facts.d and purge
  unmanaged resources

### Private Classes

- `facter::package`: Handles the package installation
- `facter::params`: Various platform dependent variables
- `facter::package::portage`: Gentoo/Portage specific, handles KEYWORDS and USE
  flags of the dev-ruby/facter package

### Parameters

The following parameters are available for the hiera class:

#### `package_name`
The facter package name. Default: facter or platform dependent
#### `ensure`
The ensure value of the facter package. Default: present
#### `provider`
The package provider. Default: undef
#### `install_options`
The install\_options param for the package provider. Default: undef
#### `purge_unmanaged`
Whether to purge all unmanaged external facts from /etc/facter/facts.d. Default: false
#### `owner`
The owner of the /etc/facter and facts.d directories. Default: undef
#### `group`
The group of the /etc/facter and facts.d directories. Default: undef
#### `mode`
The mode of the /etc/facter and facts.d directories. Default: undef
