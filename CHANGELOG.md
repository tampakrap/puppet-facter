CHANGELOG
=========

0.2.0
-----

2015-05-30

* Add documentation about Parameters
* Add params to change the permissions of the /etc/facter and facts.d directories
* [#9](http://github.com/tampakrap/puppet-facter/issues/9) Updates in the `content` parameter:
  * Accept boolean content
  * Change its default value to 'true'
  * Make it optional
* [#8](http://github.com/tampakrap/puppet-facter/issues/8) Add option to remove unmanaged fact resources
  * This introduces a new dependency to the [puppetlabs/stdlib](http://forge.puppetlabs.com/puppetlabs/stdlib) module

0.1.2
-----

2015-02-05

* Fix testcase for nonexistent provider
* [#2](http://github.com/tampakrap/puppet-facter/pull/2) Refactor the fact provider
* [#2](http://github.com/tampakrap/puppet-facter/pull/2) Handle invalid inputs when parsing
* [#3](http://github.com/tampakrap/puppet-facter/pull/3) Split integration and unit tests
* [#4](http://github.com/tampakrap/puppet-facter/pull/4) Refactor the class tests to use [puppet\_spec\_facts](https://github.com/danieldreier/puppet_spec_facts)
* Remove the openSUSE Tumbleweed support, it will be brought back on the next released openSUSE version
* Use latest forge releases instead of git master for fixtures

0.1.1
-----

2015-02-01

* [#1](http://github.com/tampakrap/puppet-facter/pull/1) Make :content mandatory

0.1.0
-----

2015-02-01

* Initial release
