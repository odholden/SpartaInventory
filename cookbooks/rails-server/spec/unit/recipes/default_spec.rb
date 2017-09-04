#
# Cookbook:: rails-server
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'rails-server::default' do
  context 'When all attributes are default, on an Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    it "should install nginx" do
      expect(chef_run).to install_package 'nginx'
    end
    it "enables the nginx service" do
      expect(chef_run).to enable_service 'nginx'
    end
    it "starts the nginx service" do
      expect(chef_run).to start_service 'nginx'
    end
    it "creates nginx.default" do
      expect(chef_run).to create_template('/etc/nginx/sites-available/default')
    end
    it "restarts nginx" do
      template = chef_run.template('/etc/nginx/sites-available/default')
      expect(template).to notify('service[nginx]').to(:reload)
    end

    it "should install git-core" do
      expect(chef_run).to install_package 'git-core'
    end

    it "should install curl" do
      expect(chef_run).to install_package 'curl'
    end

    it "should install zlib1g-dev" do
      expect(chef_run).to install_package 'zlib1g-dev'
    end

    it "should install build-essential" do
      expect(chef_run).to install_package 'build-essential'
    end

    it "should install libssl-dev" do
      expect(chef_run).to install_package 'libssl-dev'
    end

    it "should install libreadline-dev" do
      expect(chef_run).to install_package 'libreadline-dev'
    end

    it "should install libyaml-dev" do
      expect(chef_run).to install_package 'libyaml-dev'
    end

    it "should install libsqlite3-dev" do
      expect(chef_run).to install_package 'libsqlite3-dev'
    end

    it "should install sqlite3" do
      expect(chef_run).to install_package 'sqlite3'
    end

    it "should install libxml2-dev" do
      expect(chef_run).to install_package 'libxml2-dev'
    end

    it "should install libxslt1-dev" do
      expect(chef_run).to install_package 'libxslt1-dev'
    end

    it "should install libcurl4-openssl-dev" do
      expect(chef_run).to install_package 'libcurl4-openssl-dev'
    end

    it "should install python-software-properties" do
      expect(chef_run).to install_package 'python-software-properties'
    end

    it "should install libffi-dev" do
      expect(chef_run).to install_package 'libffi-dev'
    end

    # it "should install nodejs" do
    #   expect(chef_run).to install_package 'nodejs'
    # end

    it "should install libpq-dev" do
      expect(chef_run).to install_package 'libpq-dev'
    end

    it "should install apt-transport-https" do
      expect(chef_run).to install_package 'apt-transport-https'
    end

    it "should install ca-certificates" do
      expect(chef_run).to install_package 'ca-certificates'
    end

    it "should install git" do
      expect(chef_run).to include_recipe 'git'
    end

    
  end
end
