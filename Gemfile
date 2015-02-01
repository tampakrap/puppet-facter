source 'https://rubygems.org'

group :test do
  gem 'rspec', '~> 2'
  gem 'rspec-puppet',
    :git => 'git://github.com/rodjek/rspec-puppet',
    :tag => 'v2.0.0'
  gem 'puppet', ENV['PUPPET_VERSION'] || '~> 3.7.3'
  gem 'puppetlabs_spec_helper'
  gem 'metadata-json-lint'
end
