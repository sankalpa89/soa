# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html
#
property :prd_name, String, required: true
property :prd_file, String, required: true


action :install do


template "#{node['soa_env']['fmw']['tmploc']}/#{new_resource.prd_name}.rsp" do
  source "#{new_resource.prd_name}.erb"
  variables({
    :ora_home   => "#{node['soa_env']['fmw']['oracle_home']}"
    })
end

template "#{node['soa_env']['fmw']['tmploc']}/oraInst.loc" do
  source "oraInst.erb"
  variables({
    :inv_loc   => "#{node['soa_env']['fmw']['inventory_loc']}",
    :grp   => "#{node['soa_env']['fmw']['inst_group']}"
    })
end


execute 'install' do
   command "#{node['soa_env']['fmw']['java_home']}/bin/java #{node['soa_env']['fmw']['inst_jvm_args']} -Djava.io.tmpdir=#{node['soa_env']['fmw']['tmploc']} -jar #{new_resource.prd_file} -silent -responseFile #{node['soa_env']['fmw']['tmploc']}/#{new_resource.prd_name}.rsp -invPtrLoc #{node['soa_env']['fmw']['tmploc']}/oraInst.loc"


  end



end


action :uninstall do


template "#{node['soa_env']['fmw']['tmploc']}/#{new_resource.prd_name}uninst.rsp" do
  source "#{new_resource.prd_name}uninst.erb"
  variables({
    :ora_home   => "#{node['soa_env']['fmw']['oracle_home']}"
    })
end




execute 'uninstall' do
   command "#{node['soa_env']['fmw']['oracle_home']}/oui/bin/deinstall.sh -silent -responseFile #{node['soa_env']['fmw']['tmploc']}/#{new_resource.prd_name}uninst.rsp"


 end

 end


