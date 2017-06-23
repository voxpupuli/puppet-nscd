require 'spec_helper'
describe 'nscd' do
  context 'with defaults for all parameters' do
    it { is_expected.to contain_class('nscd::install') }
    it { is_expected.to contain_class('nscd::config') }
    it { is_expected.to contain_class('nscd::service') }
    it { is_expected.to contain_package('nscd').with_ensure('present') }
    it { is_expected.to contain_service('nscd').with_ensure('running') }
  end

  context 'with pkg_ensure => "absent"' do
    let(:params) { { pkg_ensure: 'absent' } }

    it { is_expected.to contain_package('nscd').with_ensure('absent') }
  end

  context 'with service_ensure => "stopped"' do
    let(:params) { { service_ensure: 'stopped' } }

    it { is_expected.to contain_service('nscd').with_ensure('stopped') }
  end

  context 'with service_enable => false' do
    let(:params) { { service_enable: false } }

    it { is_expected.to contain_service('nscd').with_enable(false) }
  end
end
