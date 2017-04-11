#
# Cookbook:: node-server
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'node-server::default' do
  context 'When all attributes are default, on an Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04') #Change ServerRunner to SoloRunner
      runner.converge(described_recipe)
    end

    # start of tests

    it 'Converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'Chould have installed xnginx' do
      expect(chef_run).to install_package 'nginx'
    end

    it 'Enables the nginx service' do
      expect(chef_run).to enable_service 'nginx'
    end

    it 'Starts the nginx servce' do
      expect(chef_run).to start_service 'nginx'
    end

    it 'Should include recipe apt' do
      expect(chef_run).to include_recipe 'apt'
    end

    it 'Should include recipe nodejs' do
      expect(chef_run).to include_recipe 'nodejs'
    end

    it 'Should include recipe git' do
      expect(chef_run).to include_recipe 'nodejs::npm'
    end

    it 'Should include recipe npm' do
      expect(chef_run).to include_recipe 'git::default'
    end

    it 'Should include recipe nodejs::npm' do
      expect(chef_run).to include_recipe 'nodejs::npm'
    end

    it 'Should include pm2 via :npm' do
      expect(chef_run).to install_nodejs_npm 'pm2'
    end





  end
end
