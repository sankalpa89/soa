property :patch_file, String, required: true

 action :apply do

 archive_file "#{new_resource.patch_file}" do


  destination node['soa_env']['patch']['tmploc']
  action :extract
  overwrite true

  end
  bash 'apply_patch' do

  code <<-EOH
    cd #{node['soa_env']['patch']['tmploc']}
    var=$(zip -Tv #{new_resource.patch_file} | grep testing | head -1 | awk '{print $2}' | cut -f1 -d /)
        cd #{node['soa_env']['patch']['tmploc']}/$var
        if [ -f opatch_generic.jar ]
    then
    #{node['soa_env']['patch']['java_home']}/bin/java -jar opatch_generic.jar -silent oracle_home=#{node['soa_env']['patch']['oracle_home']}
    else
        export ORACLE_HOME=#{node['soa_env']['patch']['oracle_home']}
    #{node['soa_env']['patch']['oracle_home']}/OPatch/opatch apply -silent
    fi

  EOH
  only_if { ::File.exist?("#{node['soa_env']['patch']['oracle_home']}/OPatch/opatch") }
end

end

action :rollback do

 archive_file "#{new_resource.patch_file}" do


  destination node['soa_env']['patch']['tmploc']
  action :extract
  overwrite true

  end
  bash 'rollback_patch' do

  code <<-EOH
    cd #{node['soa_env']['patch']['tmploc']}
    var=$(zip -Tv #{new_resource.patch_file} | grep testing | head -1 | awk '{print $2}' | cut -f1 -d /)
        cd #{node['soa_env']['patch']['tmploc']}/$var
        if [ -f opatch_generic.jar ]
    then
    echo "Opatch installation cannot be rollbacked,please dont retry"
    else
        export ORACLE_HOME=#{node['soa_env']['patch']['oracle_home']}
    #{node['soa_env']['patch']['oracle_home']}/OPatch/opatch rollback -id $var -silent
    fi

  EOH
  only_if { ::File.exist?("#{node['soa_env']['patch']['oracle_home']}/OPatch/opatch") }
end

end

