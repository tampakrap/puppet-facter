require 'spec_helper'

describe 'facter::package::portage' do
  context 'when using stable keywords' do
    it { should_not contain_package_keywords('facter') }
  end

  context 'when using unstable keywords' do
    let(:params) { { :keywords => '~amd64' } }
    it { should contain_package_keywords('facter').with_keywords('~amd64') }
  end
end
