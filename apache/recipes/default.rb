#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

package 'httpd'

service 'httpd' do
 action [:start, :enable]
end

template '/var/www/html/index.html' do
 source 'index.erb'
end
