#
# Cookbook:: soa_env
# Recipe:: rcu
#
# Copyright:: 2021, The Authors, All Rights Reserved.
#

if node['soa_env']['rcu']['lifecycle'] == 'create'

soa_env_rcuop "rcuResponseFile" do
rcu_fname "rcuResponseFile"
action :create

end

  
end


if node['soa_env']['rcu']['lifecycle'] == 'drop'

soa_env_rcuop "rcuResponseFile" do
rcu_fname "rcuResponseFile"
action :drop

end

  
end

