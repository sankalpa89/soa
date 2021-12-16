


default['soa_env']['rcu']['tmploc'] = "/app/binaries/tmp"
default['soa_env']['rcu']['oracle_home'] = "/app/Oracle/Middleware/Oracle_Home/"
default['soa_env']['rcu']['connstring']="192.168.1.9:1521:XEPDB1"
default['soa_env']['rcu']['sysdbausername']="SYS"
default['soa_env']['rcu']['sysdbapass']="shankaracharya"
default['soa_env']['rcu']['schemausrs']=["IAU_APPEND", "COMMON_SCHEMA_PASSWORD", "WLS_RUNTIME", "IAU_VIEWER", "SOAINFRA", "ESS", "OPSS", "STB", "WLS", "MDS", "IAU", "UMS"]
default['soa_env']['rcu']['schemapwds']=["welcome1", "welcome1", "welcome1", "welcome1", "welcome1", "welcome1", "welcome1", "welcome1", "welcome1", "welcome1", "welcome1", "welcome1"] 
default['soa_env']['rcu']['schemaprefix']="DEV12"
default['soa_env']['rcu']['walletloc']="/app/binaries/tmp/dbwallet5"
default['soa_env']['rcu']['lifecycle']="create" #create/drop

