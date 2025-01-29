# frozen_string_literal: true

require 'spec_helper'

describe 'fail2ban::filter' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      let(:pre_condition) do
        'include fail2ban'
      end

      let(:title) { 'gitlab' }

      let(:params) do
        {
          failregex: [
            '^: Failed Login: username=<F-USER>.+</F-USER> ip=<HOST>$',
          ],
        }
      end

      it do
        is_expected.to contain_file('/etc/fail2ban/filter.d/gitlab.local').with(
          ensure: 'present',
          owner: 'root',
          group: 'root',
          mode: '0644',
          content: <<~CONTENT,
            # This file is managed by Puppet. DO NOT EDIT.

            [Definition]
            failregex = ^: Failed Login: username=<F-USER>.+</F-USER> ip=<HOST>$
          CONTENT
        )
      end
    end
  end
end
