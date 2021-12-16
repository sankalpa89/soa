#
# Cookbook:: soa_env
# Recipe:: fmw
#
# Copyright:: 2021, The Authors, All Rights Reserved.
#
if node['soa_env']['fmw']['lifecycle'] == 'install'
var = 0
node['soa_env']['fmw']['products'].each do |prds|

pt = node['soa_env']['fmw']['installer_file'][var]
soa_env_fmw node['soa_env']['fmw']['products'] do


prd_name node['soa_env']['fmw']['products'][var]
prd_file node['soa_env']['fmw']['installer_file'][var]

action :install

only_if { ::File.exist?("#{pt}") }

end

  puts "#{node['soa_env']['fmw']['installer_file'][var]}"
  var = var + 1

end

end

if node['soa_env']['fmw']['lifecycle'] == 'uninstall'
var = 0
node['soa_env']['fmw']['products'].each do |prds|


soa_env_fmw node['soa_env']['fmw']['products'] do


prd_name node['soa_env']['fmw']['products'][var]
prd_file node['soa_env']['fmw']['installer_file'][var]

action :uninstall

only_if { ::File.exist?("#{node['soa_env']['fmw']['oracle_home']}/oui/bin/deinstall.sh") }

end

  var = var + 1

end

end

