# frozen_string_literal: true

require 'spec_helper'

describe 'fail2ban' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }

      it { is_expected.to contain_package('fail2ban') }
      it { is_expected.to contain_file('/etc/fail2ban/fail2ban.local') }
      it { is_expected.to contain_file('/etc/fail2ban/jail.local') }
      it { is_expected.to contain_service('fail2ban') }
    end
  end
end
