require 'spec_helper_acceptance'

describe 'nscd class' do
  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'works idempotently with no errors' do
      pp = <<-EOS
      class { 'nscd':}
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end

    describe package('nscd') do
      it { is_expected.to be_installed }
    end
    describe service('nscd') do
      it { is_expected.to be_running }
    end
    describe file('/etc/nscd.conf') do
      it { is_expected.to be_file }
    end
  end
  context 'all parameters set' do
    # Using puppet_apply as a helper
    it 'works idempotently with no errors' do
      pp = <<-EOS
      class { 'nscd':
        pkg_ensure => 'latest',
        service_ensure => true,
        service_enable => true,
        stat_user => 'nobody',
        threads   => 10,
        max_threads => 22,
        paranoia => true,
        restart_interval => 100,
        debug_level => 5,
        reload_count => 20,
        logfile => '/var/log/nscd_log.log',
        dbconfig => {
          'passwd' => {
            'enable-cache'          => true,
            'positive-time-to-live' => 100,
            'negative-time-to-live' => 23,
            'suggested-size'        => 1234567,
            'check-files'           => true,
            'persistent'            => true,
            'shared'                => true,
            'max-db-size'           => 12345678900,
            'auto-propagate'        => true,
          },
          'group' => {
            'enable-cache'          => true,
            'positive-time-to-live' => 100,
            'negative-time-to-live' => 23,
            'suggested-size'        => 1234567,
            'check-files'           => true,
            'persistent'            => true,
            'shared'                => true,
            'max-db-size'           => 12345678900,
            'auto-propagate'        => true,
          },
          'hosts' => {
            'enable-cache'          => true,
            'positive-time-to-live' => 100,
            'negative-time-to-live' => 23,
            'suggested-size'        => 1234567,
            'check-files'           => true,
            'persistent'            => true,
            'shared'                => true,
            'max-db-size'           => 12345678900,
            'auto-propagate'        => true,
          },
          'services' => {
            'enable-cache'          => true,
            'positive-time-to-live' => 100,
            'negative-time-to-live' => 23,
            'suggested-size'        => 1234567,
            'check-files'           => true,
            'persistent'            => true,
            'shared'                => true,
            'max-db-size'           => 12345678900,
            'auto-propagate'        => true,
          },
          'netgroup' => {
            'enable-cache'          => true,
            'positive-time-to-live' => 100,
            'negative-time-to-live' => 23,
            'suggested-size'        => 1234567,
            'check-files'           => true,
            'persistent'            => true,
            'shared'                => true,
            'max-db-size'           => 12345678900,
            'auto-propagate'        => true,
          },
        },
      }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end

    describe package('nscd') do
      it { is_expected.to be_installed }
    end
    describe service('nscd') do
      it { is_expected.to be_running }
    end
    describe file('/etc/nscd.conf') do
      it { is_expected.to be_file }
    end
  end
end
