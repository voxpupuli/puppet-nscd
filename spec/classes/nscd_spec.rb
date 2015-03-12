require 'spec_helper'
describe 'nscd' do

  context 'with defaults for all parameters' do
    it { should contain_class('nscd::install') } 
    it { should contain_class('nscd::config') }
    it { should contain_class('nscd::service') }
    it { should contain_package('nscd').with_ensure('present')}
    it { should contain_service('nscd').with_ensure('running')}
  end

  context 'with pkg_ensure => "absent"' do
    let(:params) { {:pkg_ensure => 'absent'} }
    it { should contain_package('nscd').with_ensure('absent')}
  end

  context 'with service_ensure => "stopped"' do
    let(:params) { {:service_ensure => 'stopped'} }
    it { should contain_service('nscd').with_ensure('stopped') }
  end

  context 'with service_enable => false' do
    let(:params) { {:service_enable => false} }
    it { should contain_service('nscd').with_enable(false) }
  end

end
