#
# Cookbook:: 2tomcat
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

package %w(tomcat tomcat-webapps java-1.8.0-openjdk.x86_64)

bash 'tomcat7' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
    wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.72/bin/apache-tomcat-8.5.72.tar.gz
    tar -zxf apache-tomcat-8.5.72.tar.gz
   # cd apachei*/bin
   # ./startup.sh
  EOH
  not_if { ::File.exist?('/tmp/apache-tomcat-8.5.72/bin/startup.sh') }
end

template '/tmp/apache-tomcat-8.5.72/conf/server.xml' do
  source 'server.xml.erb'
end

service 'tomcat' do
  action [:enable, :start]
end

bash 'tomcat7' do
  user 'root'
  code <<-EOH
    cd /tmp/apache-tomcat-8.5.72/bin/
    ./startup.sh
  EOH
end

