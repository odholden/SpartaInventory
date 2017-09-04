#
# Cookbook:: rails-server
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# is vagrant?
user = File.directory?("/home/vagrant") ?  "vagrant" : node['rails-server']['user']

include_recipe 'git'

apt_repository 'ruby2.4' do
  uri        'ppa:brightbox/ruby-ng'
end

# update node version
remote_file '/tmp/nodesource_setup.sh' do
  source 'https://deb.nodesource.com/setup_6.x'
  action :create
end

execute "update node resources" do
    command "bash /tmp/nodesource_setup.sh"
end

apt_update 'update'

package 'nodejs'
package 'ruby2.4'
package 'ruby2.4-dev'
package 'build-essential'
package 'libpq-dev'

gem_package 'bundler'

