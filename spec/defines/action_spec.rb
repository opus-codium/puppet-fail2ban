# frozen_string_literal: true

require 'spec_helper'

describe 'fail2ban::action' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      let(:pre_condition) do
        'include fail2ban'
      end

      let(:title) { 'foo' }

      let(:params) do
        {
          'content' => {
            'Init' => {
              'foo' => 'bar',
              'baz' => 'wux',
            },
            'Multi-Line' => {
              'multi-line' => "line1\nline2",
            },
          },
        }
      end

      it do
        is_expected.to contain_file('/etc/fail2ban/action.d/foo.local').with(
          ensure: 'present',
          owner: 'root',
          group: 'root',
          mode: '0644',
          content: <<~CONTENT,
            # This file is managed by Puppet. DO NOT EDIT.

            [Init]
            foo = bar
            baz = wux
            [Multi-Line]
            multi-line = line1
                         line2
          CONTENT
        )
      end
    end
  end
end
