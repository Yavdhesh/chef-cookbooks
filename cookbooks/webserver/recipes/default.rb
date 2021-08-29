#
# Cookbook:: webserver
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

package 'apache2' do
  action [:install]
end

service 'apache2' do
  action [:start, :enable]
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
end


hook = data_bag_item('urllocation', 'sample')
http_request 'callback' do
   url hook['url']
end


