require 'spec_helper'
describe 'nscd' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'with defaults for all parameters' do
        it { is_expected.to contain_class('nscd::install') }
        it { is_expected.to contain_class('nscd::config') }
        it { is_expected.to contain_class('nscd::service') }
        it { is_expected.to contain_package('nscd').with_ensure('present') }
        it { is_expected.to contain_service('nscd').with_ensure(true) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^\s*positive-time-to-live\s+passwd\s+600$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^\s*negative-time-to-live\s+passwd\s+20$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^\s*positive-time-to-live\s+group\s+3600$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^\s*negative-time-to-live\s+group\s+60$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^\s*positive-time-to-live\s+hosts\s+3600$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^\s*negative-time-to-live\s+hosts\s+20$}) }
        case facts[:operatingsystemmajrelease]
        when '5'
          it { is_expected.to contain_file('/etc/nscd.conf').without_content(%r{^\s*positive-time-to-live\s+services.*$}) }
          it { is_expected.to contain_file('/etc/nscd.conf').without_content(%r{^\s*negative-time-to-live\s+services.*$}) }
        else
          it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^\s*positive-time-to-live\s+services\s+28800$}) }
          it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^\s*negative-time-to-live\s+services\s+20$}) }
        end
      end

      context 'with pkg_ensure => "absent"' do
        let(:params) { { pkg_ensure: 'absent' } }

        it { is_expected.to contain_package('nscd').with_ensure('absent') }
      end

      context 'with service_ensure => false' do
        let(:params) { { service_ensure: false } }

        it { is_expected.to contain_service('nscd').with_ensure(false) }
      end

      context 'with service_enable => false' do
        let(:params) { { service_enable: false } }

        it { is_expected.to contain_service('nscd').with_enable(false) }
      end
      context 'with all integer values set' do
        let(:params) do
          { restart_interval: 1001,
            passwd_negative_ttl: 1002,
            passwd_positive_ttl: 1003,
            group_negative_ttl: 1004,
            group_positive_ttl: 1005,
            hosts_negative_ttl: 1006,
            hosts_positive_ttl: 1007,
            services_negative_ttl: 1008,
            services_positive_ttl: 1009 }
        end

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^\s*restart-interval\s+1001$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^\s*negative-time-to-live\s+passwd\s+1002$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^\s*positive-time-to-live\s+passwd\s+1003$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^\s*negative-time-to-live\s+group\s+1004$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^\s*positive-time-to-live\s+group\s+1005$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^\s*negative-time-to-live\s+hosts\s+1006$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^\s*positive-time-to-live\s+hosts\s+1007$}) }
        case facts[:operatingsystemmajrelease]
        when '5'
          it { is_expected.to contain_file('/etc/nscd.conf').without_content(%r{^\s*negative-time-to-live\s+services.*$}) }
          it { is_expected.to contain_file('/etc/nscd.conf').without_content(%r{^\s*positive-time-to-live\s+services.*$}) }
        else
          it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^\s*negative-time-to-live\s+services\s+1008$}) }
          it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^\s*positive-time-to-live\s+services\s+1009$}) }
        end
      end
      context 'with passwd_cache set false' do
        let(:params) { { passwd_cache: false } }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^\s*enable-cache\s+passwd\s+no$}) }
      end
      context 'with passwd_cache set true' do
        let(:params) { { passwd_cache: true } }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^\s*enable-cache\s+passwd\s+yes$}) }
      end
      context 'with group_cache set true' do
        let(:params) { { group_cache: true } }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^\s*enable-cache\s+group\s+yes$}) }
      end
      context 'with group_cache set false' do
        let(:params) { { group_cache: false } }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^\s*enable-cache\s+group\s+no$}) }
      end
      context 'with hosts_cache set false' do
        let(:params) { { hosts_cache: false } }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^\s*enable-cache\s+hosts\s+no$}) }
      end
      context 'with hosts_cache set true' do
        let(:params) { { hosts_cache: true } }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^\s*enable-cache\s+hosts\s+yes$}) }
      end
      case facts[:operatingsystemmajrelease]
      when '5'
        it { is_expected.to contain_file('/etc/nscd.conf').without_content(%r{^\s*enable-cache\s+services.*$}) }
      else
        context 'with services_cache set false' do
          let(:params) { { services_cache: false } }

          it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^\s*enable-cache\s+services\s+no$}) }
        end
        context 'with services_cache set true' do
          let(:params) { { services_cache: true } }

          it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^\s*enable-cache\s+services\s+yes$}) }
        end
      end
    end
  end
end
