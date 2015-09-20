#
# Cookbook Name:: nginx-website
# Recipe:: default
#
# Author: Kamil Tunkiewicz
#

sites = data_bag("websites")

sites.each do |site|
  website = data_bag_item("websites", site)
  type = website['type'] || 'php-fpm'
  ssl_enabled = website['ssl_enabled'] || false

  template "/etc/nginx/sites-available/#{website['name']}.conf" do
    source 'server.erb'
    owner 'root'
    group 'root'
    mode '0644'
    variables ({
      :hostname => website['hostname'],
      :name => website['name'],
      :root => website['root'],
      :type => website['type'],
      :ssl_enabled => website['ssl_enabled']
    })
    notifies :restart, 'service[nginx]', :delayed
  end

  link "/etc/nginx/sites-enabled/#{website['name']}.conf" do
    to "/etc/nginx/sites-available/#{website['name']}.conf"
    action :create
  end


end
