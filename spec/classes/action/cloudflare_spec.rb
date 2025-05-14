# frozen_string_literal: true

require 'spec_helper'

describe 'fail2ban::action::cloudflare' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      let(:pre_condition) do
        'include fail2ban'
      end

      let(:params) do
        {
          'user'  => 'user@example.com',
          'token' => sensitive('secret'),
        }
      end

      it do
        is_expected.to contain_file('/etc/fail2ban/action.d/cloudflare.local').with(
          content: sensitive(<<~CONTENT),
            # This file is managed by Puppet. DO NOT EDIT.

            [Init]
            cfuser = user@example.com
            cftoken = secret
          CONTENT
          mode: '0640'
        )
      end
    end
  end
end
