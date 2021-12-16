#
# Cookbook:: soa_env
# Recipe:: jdk
#
# Copyright:: 2021, The Authors, All Rights Reserved.
#
#
if node['soa_env']['jdk']['lifecycle'] == 'install'

 directory "#{node['soa_env']['jdk']['dest_loc']}" do
 
 action :create
 recursive true
 
 end
 
 node.default['jdk_var'] = `printf $(tar -tf #{node['soa_env']['jdk']['zipfile']} | head -1 | cut -f1 -d '/')`
 
 archive_file "#{node['soa_env']['jdk']['zipfile']}" do
 
  
  destination node['soa_env']['jdk']['dest_loc']
  action :extract
  overwrite true
  
  not_if { ::File.exist?("#{node['soa_env']['jdk']['dest_loc']}/#{node['soa_env']['jdk']['dirname']}/bin/java")}

  notifies :run, 'execute[rename_jdk]', :immediately
end

 execute 'rename_jdk' do
  command "mv #{node['soa_env']['jdk']['dest_loc']}/#{node.default['jdk_var']} #{node['soa_env']['jdk']['dest_loc']}/#{node['soa_env']['jdk']['dirname']}"
  not_if { node.default['jdk_var'] == node['soa_env']['jdk']['dirname'] }
  action :nothing
end



link "#{node['soa_env']['jdk']['sym_link']}" do
  to "#{node['soa_env']['jdk']['dest_loc']}/#{node['soa_env']['jdk']['dirname']}"
  not_if { node['soa_env']['jdk']['sym_link'] == "" }
end
 
end

if node['soa_env']['jdk']['lifecycle'] == 'uninstall'

 execute 'uninstall_java' do
   command "cp -rp #{node['soa_env']['jdk']['dest_loc']}/#{node['soa_env']['jdk']['dirname']}  #{node['soa_env']['jdk']['tmploc']} && rm -rf #{node['soa_env']['jdk']['dest_loc']}/#{node['soa_env']['jdk']['dirname']}"


only_if { ::File.exist?("#{node['soa_env']['jdk']['dest_loc']}/#{node['soa_env']['jdk']['dirname']}/bin/java")}

  end

link "#{node['soa_env']['jdk']['sym_link']}" do
  to "#{node['soa_env']['jdk']['dest_loc']}/#{node['soa_env']['jdk']['dirname']}"
  action :delete
  not_if { node['soa_env']['jdk']['sym_link'] == "" }
  end 

end
