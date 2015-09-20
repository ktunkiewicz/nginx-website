#
# Cookbook Name:: nginx-website
# Recipe:: default
#
# Author: Kamil Tunkiewicz
#

sites = data_bag("websites")

is_default_site = true;

sites.each do |site|
  website = data_bag_item("websites", site)
  type = website['php_type'] || 'phpfpm-socket'
  ssl_enabled = website['ssl_enabled'] || false

  directory '/etc/nginx/ssl' do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end

  file "/etc/nginx/ssl/#{website['name']}.crt" do
    content "-----BEGIN CERTIFICATE-----\n#{website['ssl_certificate']}'\n-----END CERTIFICATE-----"
    owner 'root'
    group 'root'
    mode '0660'
  end

  file "/etc/nginx/ssl/#{website['name']}.key" do
    content "-----BEGIN RSA PRIVATE KEY-----\n#{website['ssl_certificate_key']}'\n-----END RSA PRIVATE KEY-----"
    owner 'root'
    group 'root'
    mode '0660'
  end

  template "/etc/nginx/sites-available/#{website['name']}.conf" do
    source 'server.erb'
    owner 'root'
    group 'root'
    mode '0644'
    variables ({
      :hostname => website['hostname'],
      :name => website['name'],
      :root => website['root'],
      :php_type => website['php_type'],
      :ssl_enabled => website['ssl_enabled'],
      :is_default_site => is_default_site
    })
    notifies :restart, 'service[nginx]', :delayed
  end

  link "/etc/nginx/sites-enabled/#{website['name']}.conf" do
    to "/etc/nginx/sites-available/#{website['name']}.conf"
    action :create
  end

  is_default_site = false;
end
