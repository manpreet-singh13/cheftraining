package "httpd" do
 action :install
end

service "httpd" do
 action [:start, :enable]
end

node["lamp_stack"]["sites"].each do |sitename, data|
 document_root = "/var/www/html/#{sitename}/public_html"
 directory document_root do
  mode "0755"
  recursive true
 end

 template "/etc/httpd/conf.d/#{sitename}.conf" do
  source "virtualhosts.erb"
  mode "0644"
  variables(
   :document_root => document_root,
   :port => data["port"],
   :serveradmin => data["serveradmin"],
   :servername => data["servername"]
  )
 end

 file "#{document_root}/index.html" do
  content "#{sitename}"
 end

 template "/etc/hosts" do
  source "hosts.erb"
 end

end

