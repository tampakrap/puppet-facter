require 'spec_helper'

describe 'facter' do
  it { should compile.with_all_deps }
  it { should contain_class('facter::package') }
  it { should contain_file('/etc/facter').that_comes_before('File[/etc/facter/facts.d]').with_ensure('directory') }
  it { should contain_file('/etc/facter/facts.d').with_ensure('directory') }

  context 'when using distro provider' do
    context 'on Debian' do
      let(:facts) { { :operatingsystem => 'Debian' } }
      it { should contain_package('facter').with_ensure('present') }
    end

    context 'on openSUSE, SLE' do
      let(:facts) do
        {
          :osfamily               => 'Suse',
          :operatingsystemrelease => '13.2',
        }
      end
      it do should contain_package('facter').with(
        'ensure'   => 'present',
        'provider' => 'zypper',
      ) end
    end

    context 'on openSUSE Tumbleweed' do
      let(:facts) do
        {
          :osfamily               => 'Suse',
          :operatingsystemrelease => '13.3',
        }
      end
      let(:params) { { :ensure => 'latest' } }
      it { should_not contain_package('facter') }
      it { should contain_package('ruby2.1-rubygem-facter').with_ensure('latest') }
      it { should contain_package('rubygem-facter').with_ensure('latest') }
    end

    context 'on Gentoo' do
      let(:facts) { { :osfamily => 'Gentoo' } }
      it do should contain_package('dev-ruby/facter').with(
        'ensure'   => 'present',
        'provider' => 'portage',
      ) end
      it { should_not contain_package('facter') }
      it { should contain_class('facter::package::portage') }
    end
  end

  context 'when using gem as provider' do
    let(:params) { { :provider => 'gem' } }
    let(:facts) { { :operatingsystem => 'Gentoo' } }
    it do should contain_package('facter').with(
      'ensure'   => 'present',
      'provider' => 'gem',
    ) end
  end

  context 'when using custom package name' do
    let(:params) { { :package_name => 'custom_facter' } }
    it { should contain_package('custom_facter').with_ensure('present') }
  end
end
