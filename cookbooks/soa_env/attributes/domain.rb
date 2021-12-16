default['soa_env']['domain']['tmploc'] = "/tmp"
default['soa_env']['domain']['oracle_home'] = "/app/Oracle/Middleware/Oracle_Home/"
default['soa_env']['domain']['name'] = "fmw_domain17"
default['soa_env']['domain']['path'] = "/app/soaprojects/domains/fmw_domain17"
default['soa_env']['domain']['app_path'] = "/app/soaprojects/applications4/fmw_domain17"
default['soa_env']['domain']['java_home'] = "/app/java/fmwjdk"
default['soa_env']['domain']['mode'] = "prod"
default['soa_env']['domain']['ext'] = ["soa", "osb"]
default['soa_env']['domain']['lifecycle'] = "pack" #create/delete/pack/unpack

default['soa_env']['domain']['admin_server_name'] = "AdminServer"
default['soa_env']['domain']['admin_user_name'] = "weblogic"
default['soa_env']['domain']['admin_password'] = "weblogic123"
default['soa_env']['domain']['admin_server_port'] = 8004
default['soa_env']['domain']['admin_listen_address'] = "192.168.1.4"
default['soa_env']['domain']['admin_ssl_enable'] = true
default['soa_env']['domain']['admin_ssl_port'] = 8015
default['soa_env']['domain']['admin_startup_args'] = "-Xms512m -Xmx1500m"

default['soa_env']['domain']['db_repourl'] = "jdbc:oracle:thin:@192.168.1.9:1521/XEPDB1"
default['soa_env']['domain']['schemauser_prefix'] = "DEV12"
default['soa_env']['domain']['schemauser_password'] = "welcome1"
#default['soa_env']['domain']['servers']['osb_server2'] = ["nodemanager1", "192.168.1.2", "7766", "-XX:PermSize=256m -XX:MaxPermSize=512m -Xms1024m -Xmx1024m"]
#default['soa_env']['domain']['servers']['osb_server3'] = ["nodemanager1", "192.168.1.4", "7766", "-XX:PermSize=256m -XX:MaxPermSize=512m -Xms1024m -Xmx1024m"]
#
default['soa_env']['domain']['servers'] = [
      {
        "name": "osb_server1",
        "server_groups": ["OSB-MGD-SVRS-COMBINED"],
        "listen_address": "192.168.1.4",
        "listen_port": 5011,
		"ssl_enable": true,
        "ssl_port": 6011,
        "startup_arguments": "-Xms1024m -Xmx1024m"
      },
      {
        "name": "osb_server2",
        "server_groups": ["OSB-MGD-SVRS-COMBINED"],
        "listen_address": "192.168.1.4",
        "listen_port": 5012,
		"ssl_enable": true,
        "ssl_port": 6012,
        "startup_arguments": "-Xms1024m -Xmx1024m"
      },
      {
        "name": "soa_server1",
        "server_groups": ["SOA-MGD-SVRS"],
        "listen_address": "192.168.1.4",
        "listen_port": 5013,
		"ssl_enable": true,
        "ssl_port": 6013,
        "startup_arguments": "-Xms1024m -Xmx1024m"
      },
      {
        "name": "soa_server2",
        "server_groups": ["SOA-MGD-SVRS"],
        "listen_address": "192.168.1.4",
        "listen_port": 5014,
	"ssl_enable": true,
        "ssl_port": 6014,
        "startup_arguments": "-Xms1024m -Xmx1024m"
      }
    ]

default['soa_env']['domain']['clusters'] = [
      {
        "name": "osb_cluster",
        "members": ["osb_server1",
                    "osb_server2"],
        "address": "192.168.1.4:5011,192.168.1.4:5012"
      },
      { "name": "soa_cluster",
        "members": ["soa_server1",
                    "soa_server2"],
        "address": "192.168.1.4:5013,192.168.1.4:5014"
      }
    ]

default['soa_env']['domain']['machines'] = [
      {
        "name": "fmw_machine",
        "members": ["osb_server1",
	            "osb_server2",
                    "soa_server1",
                    "AdminServer",
                    "soa_server2"],
      	"nm_listen_address": "192.168.1.4",
        "nm_listen_port": 5560
      }
    ]

