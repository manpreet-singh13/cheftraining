#
# Cookbook:: file
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

file '/var/www/html/index.html' do
 content '<h1>This is a Heading, By Chef</h1>'
end
