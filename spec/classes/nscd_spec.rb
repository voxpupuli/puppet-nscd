# frozen_string_literal: true

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
        it { is_expected.to contain_package('nscd').with_ensure('installed') }
        it { is_expected.to contain_service('nscd').with_ensure(true) }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^threads\s+5$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^max-threads\s+32$}) }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^paranoia\s+no$}) }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^debug-level\s+0$}) }

        it { is_expected.to contain_file('/etc/nscd.conf').without_content(%r{^stat-user.*$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^reload-count\s+5}) }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^enable-cache\s+passwd\s+yes$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^enable-cache\s+group\s+yes$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^enable-cache\s+hosts\s+yes$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^enable-cache\s+services\s+yes$}) }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^positive-time-to-live\s+passwd\s+600$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^positive-time-to-live\s+group\s+3600$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^positive-time-to-live\s+hosts\s+3600$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^positive-time-to-live\s+services\s+28800$}) }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^negative-time-to-live\s+passwd\s+20$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^negative-time-to-live\s+group\s+60$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^negative-time-to-live\s+hosts\s+20$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^negative-time-to-live\s+services\s+20$}) }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^suggested-size\s+services\s+211$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^suggested-size\s+passwd\s+211$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^suggested-size\s+group\s+211$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^suggested-size\s+hosts\s+211$}) }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^check-files\s+services\s+yes$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^check-files\s+passwd\s+yes$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^check-files\s+group\s+yes$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^check-files\s+hosts\s+yes$}) }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^persistent\s+services\s+yes$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^persistent\s+passwd\s+yes$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^persistent\s+group\s+yes$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^persistent\s+hosts\s+yes$}) }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^shared\s+services\s+yes$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^shared\s+passwd\s+yes$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^shared\s+group\s+yes$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^shared\s+hosts\s+yes$}) }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^max-db-size\s+services\s+33554432$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^max-db-size\s+passwd\s+33554432$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^max-db-size\s+group\s+33554432$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^max-db-size\s+hosts\s+33554432$}) }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^auto-propagate\s+passwd\s+yes$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^auto-propagate\s+group\s+yes$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').without_content(%r{^auto-propagate\s+hosts.*$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').without_content(%r{^auto-propagate\s+services.*$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').without_content(%r{^restart-interval.*$}) }

        case facts[:os]['family']
        when 'RedHat'
          it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^logfile\s+/var/log/nscd.log$}) }
          it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^server-user\s+nscd$}) }

        else
          it { is_expected.to contain_file('/etc/nscd.conf').without_content(%r{^logfile.*$}) }
          it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^server-user\s+root$}) }
        end
      end

      context 'with stat_user => "foobar"' do
        let(:params) { { stat_user: 'foobar' } }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^stat-user\s+foobar$}) }
      end

      context 'with logfile => /foo/bar' do
        let(:params) { { logfile: '/foo/bar' } }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^logfile\s+/foo/bar$}) }
      end

      context 'with debug_level => 8' do
        let(:params) { { debug_level: 8 } }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^debug-level\s+8$}) }
      end

      context 'with reload_count => 1000' do
        let(:params) { { reload_count: 1000 } }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^reload-count\s+1000$}) }
      end

      context 'with paranoia => "true"' do
        let(:params) { { paranoia: true } }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^paranoia\s+yes$}) }
      end

      context 'with pkg_ensure => "absent"' do
        let(:params) { { pkg_ensure: 'absent' } }

        it { is_expected.to contain_package('nscd').with_ensure('absent') }
        it { is_expected.not_to contain_service('nscd') }
        it { is_expected.not_to contain_file('/etc/nscd.conf') }
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
          {
            threads: 999,
            max_threads: 1000,
            restart_interval: 1001,
            dbconfig: {
              passwd: { 'enable-cache' => true,
                        'negative-time-to-live' => 1002,
                        'positive-time-to-live' => 1003 },
              group: { 'enable-cache' => true,
                       'negative-time-to-live' => 1004,
                       'positive-time-to-live' => 1005 },
              hosts: { 'enable-cache' => true,
                       'negative-time-to-live' => 1006,
                       'positive-time-to-live' => 1007 },
              services: { 'enable-cache' => true,
                          'negative-time-to-live' => 1008,
                          'positive-time-to-live' => 1009 }

            }
          }
        end

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^threads\s+999$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^max-threads\s+1000$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^restart-interval\s+1001$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^negative-time-to-live\s+passwd\s+1002$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^positive-time-to-live\s+passwd\s+1003$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^negative-time-to-live\s+group\s+1004$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^positive-time-to-live\s+group\s+1005$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^negative-time-to-live\s+hosts\s+1006$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^positive-time-to-live\s+hosts\s+1007$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^negative-time-to-live\s+services\s+1008$}) }
        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^positive-time-to-live\s+services\s+1009$}) }
      end

      context 'with passwd cache set false' do
        let(:params) { { dbconfig: { passwd: { 'enable-cache' => false } } } }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^enable-cache\s+passwd\s+no$}) }
      end

      context 'with passwd cache set true' do
        let(:params) { { dbconfig: { passwd: { 'enable-cache' => true } } } }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^enable-cache\s+passwd\s+yes$}) }
      end

      context 'with group cache set true' do
        let(:params) { { dbconfig: { group: { 'enable-cache' => true } } } }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^enable-cache\s+group\s+yes$}) }
      end

      context 'with group cache set false' do
        let(:params) { { dbconfig: { group: { 'enable-cache' => false } } } }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^enable-cache\s+group\s+no$}) }
      end

      context 'with hosts cache set false' do
        let(:params) { { dbconfig: { hosts: { 'enable-cache' => false } } } }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^enable-cache\s+hosts\s+no$}) }
      end

      context 'with hosts cache set true' do
        let(:params) { { dbconfig: { hosts: { 'enable-cache' => true } } } }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^enable-cache\s+hosts\s+yes$}) }
      end

      context 'with services cache set false' do
        let(:params) { { dbconfig: { services: { 'enable-cache' => false } } } }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^enable-cache\s+services\s+no$}) }
      end

      context 'with services cache set true' do
        let(:params) { { dbconfig: { services: { 'enable-cache' => true } } } }

        it { is_expected.to contain_file('/etc/nscd.conf').with_content(%r{^enable-cache\s+services\s+yes$}) }
      end
    end
  end
end
