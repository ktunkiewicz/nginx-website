#
# Cookbook Name:: nginx_website
# Recipe:: default
#
# Author: Kamil Tunkiewicz
#

template "/etc/nginx/sites-available/#{node['nginx_website']['name']}.conf" do
  source 'server.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables ({
    :hostname => node['nginx_website']['hostname'],
    :name => node['nginx_website']['name'],
    :public => node['nginx_website']['public'],
    :root => node['nginx_website']['root']
  })
  action :create
  notifies :restart, 'service[nginx]', :delayed
end

link "/etc/nginx/sites-enabled/#{node['nginx_website']['name']}.conf" do
  to "/etc/nginx/sites-available/#{node['nginx_website']['name']}.conf"
  action :create
end
