property :rcu_fname, String, required: true


action :create do

execute 'addsysdba_wallet' do
  command "printf #{node['soa_env']['rcu']['sysdbapass']} > #{node['soa_env']['rcu']['tmploc']}/rcutmp && #{node['soa_env']['rcu']['oracle_home']}/oracle_common/common/bin/configWallet.sh -walletDir #{node['soa_env']['rcu']['walletloc']} -useStdin -create #{node['soa_env']['rcu']['sysdbausername']} <  #{node['soa_env']['rcu']['tmploc']}/rcutmp"
  #  command " echo #{node['soa_env']['rcu']['sysdbapass']}"
end


var = 0
node['soa_env']['rcu']['schemausrs'].each do |usrl|
usr = "#{node['soa_env']['rcu']['schemaprefix']}" + "_" + "#{usrl}"
execute 'addschusrs_wallet' do
  command "printf #{node['soa_env']['rcu']['schemapwds'][var]} > #{node['soa_env']['rcu']['tmploc']}/rcutmp && #{node['soa_env']['rcu']['oracle_home']}/oracle_common/common/bin/configWallet.sh -walletDir #{node['soa_env']['rcu']['walletloc']} -useStdin -create #{usr} < #{node['soa_env']['rcu']['tmploc']}/rcutmp"
   
end
  
    var = var + 1
 
end



template "#{node['soa_env']['rcu']['tmploc']}/#{new_resource.rcu_fname}.properties" do
  source "#{new_resource.rcu_fname}.erb"
  variables({
    :conn_string   => "#{node['soa_env']['rcu']['connstring']}",
	:sysuname  => "#{node['soa_env']['rcu']['sysdbausername']}",
	:schemapre  => "#{node['soa_env']['rcu']['schemaprefix']}",
	:wltloc  => "#{node['soa_env']['rcu']['walletloc']}",
    })
end

execute 'create' do
   command "export RCU_LOG_LOCATION=#{node['soa_env']['rcu']['tmploc']} && #{node['soa_env']['rcu']['oracle_home']}/oracle_common/bin/rcu -silent -responseFile #{node['soa_env']['rcu']['tmploc']}/#{new_resource.rcu_fname}.properties"

  end



end

action :drop do


template "#{node['soa_env']['rcu']['tmploc']}/#{new_resource.rcu_fname}drop.properties" do
  source "#{new_resource.rcu_fname}drop.erb"
  variables({
    :conn_string   => "#{node['soa_env']['rcu']['connstring']}",
	:sysuname  => "#{node['soa_env']['rcu']['sysdbausername']}",
	:schemapre  => "#{node['soa_env']['rcu']['schemaprefix']}",
	:wltloc  => "#{node['soa_env']['rcu']['walletloc']}",
    })
end

execute 'drop' do
   command "export RCU_LOG_LOCATION=#{node['soa_env']['rcu']['tmploc']} && #{node['soa_env']['rcu']['oracle_home']}/oracle_common/bin/rcu -silent -responseFile #{node['soa_env']['rcu']['tmploc']}/#{new_resource.rcu_fname}drop.properties"


  end

end

