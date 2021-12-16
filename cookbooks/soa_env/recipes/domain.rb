#
# Cookbook:: soa_env
# Recipe:: domain
#
# Copyright:: 2021, The Authors, All Rights Reserved.
#
#
if node['soa_env']['domain']['lifecycle'] == 'create'
  
  template node['soa_env']['domain']['tmploc'] + '/domain.py' do
      source 'domain.erb'
      variables(oracle_home: node['soa_env']['domain']['oracle_home'],
                domain_name: node['soa_env']['domain']['name'],
                domain_path: node['soa_env']['domain']['path'],
                app_path: node['soa_env']['domain']['app_path'],
                domain_mode: node['soa_env']['domain']['mode'],
                domain_ext: node['soa_env']['domain']['ext'],
                admin_server_name: node['soa_env']['domain']['admin_server_name'],
                admin_user_name: node['soa_env']['domain']['admin_user_name'],
                admin_password: node['soa_env']['domain']['admin_password'],
                admin_server_port: node['soa_env']['domain']['admin_server_port'],
                admin_listen_address: node['soa_env']['domain']['admin_listen_address'],
                admin_ssl_enable: node['soa_env']['domain']['admin_ssl_enable'],
                admin_ssl_port: node['soa_env']['domain']['admin_ssl_port'],
                admin_startup_args: node['soa_env']['domain']['admin_startup_args'],
                java_home: node['soa_env']['domain']['java_home'],
                db_url: node['soa_env']['domain']['db_repourl'],
                schema_user_prefix: node['soa_env']['domain']['schemauser_prefix'],
                schema_user_password: node['soa_env']['domain']['schemauser_password'],
                servers: node['soa_env']['domain']['servers'],
                clusters: node['soa_env']['domain']['clusters'],
                machines: node['soa_env']['domain']['machines'],

                )
  end

  execute 'Create_domain' do
    command "#{node['soa_env']['domain']['oracle_home']}/oracle_common/common/bin/wlst.sh   #{node['soa_env']['domain']['tmploc']}/domain.py"
    not_if { ::File.exist?("#{node['soa_env']['domain']['path']}/config/config.xml")}
    not_if { ::File.exist?("#{node['soa_env']['domain']['app_path']}")}
  end
  

end

if node['soa_env']['domain']['lifecycle'] == 'delete'

    execute 'delete_domain' do
        command " rm -rf #{node['soa_env']['domain']['path']}"
        only_if { ::File.exist?("#{node['soa_env']['domain']['path']}/config/config.xml")}
        
      end

    execute 'delete_domain_entry' do
        command " grep -v #{node['soa_env']['domain']['path']} #{node['soa_env']['domain']['oracle_home']}/domain-registry.xml > #{node['soa_env']['domain']['oracle_home']}/domain-registry.xml1 && mv #{node['soa_env']['domain']['oracle_home']}/domain-registry.xml1 #{node['soa_env']['domain']['oracle_home']}/domain-registry.xml"
        only_if { ::File.exist?("#{node['soa_env']['domain']['oracle_home']}/domain-registry.xml")}
        
      end  

end

 if node['soa_env']['domain']['lifecycle'] == 'pack'
  
    execute 'pack_domain' do
        command "#{node['soa_env']['domain']['oracle_home']}/oracle_common/common/bin/pack.sh -domain  #{node['soa_env']['domain']['path']} -template=#{node['soa_env']['domain']['tmploc']}/#{node['soa_env']['domain']['name']}.jar -template_name #{node['soa_env']['domain']['name']} -managed=true"
        only_if { ::File.exist?("#{node['soa_env']['domain']['path']}/config/config.xml")}

      end

end

if node['soa_env']['domain']['lifecycle'] == 'unpack'
  
    execute 'unpack_domain' do
        command "#{node['soa_env']['domain']['oracle_home']}/oracle_common/common/bin/unpack.sh -domain  #{node['soa_env']['domain']['path']} -template=#{node['soa_env']['domain']['tmploc']}/#{node['soa_env']['domain']['name']}.jar -template_name #{node['soa_env']['domain']['name']}"
        not_if { ::File.exist?("#{node['soa_env']['domain']['path']}/config/config.xml")}

      end

end
