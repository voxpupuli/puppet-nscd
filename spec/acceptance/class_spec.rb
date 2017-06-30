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
end
