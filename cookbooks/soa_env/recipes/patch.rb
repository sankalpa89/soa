#
# Cookbook:: soa_env
# Recipe:: patch
#
# Copyright:: 2021, The Authors, All Rights Reserved.
#
if node['soa_env']['patch']['lifecycle'] == 'apply'


node['soa_env']['patch']['file'].each do |pch|


soa_env_patch "apply patch" do

puts "#{pch}"
patch_file pch

action :apply

only_if { ::File.exist?("#{pch}") }

end


end

end

if node['soa_env']['patch']['lifecycle'] == 'rollback'


node['soa_env']['patch']['file'].each do |pch|


soa_env_patch "rollback patch" do


patch_file pch

action :rollback

only_if { ::File.exist?("#{pch}") }

end


end

end

