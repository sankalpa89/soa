default['soa_env']['jdk']['zipfile'] = "/app/binaries/jdk-8u281-linux-x64.tar.gz"
default['soa_env']['jdk']['dest_loc'] = "/app/java"
default['soa_env']['jdk']['dirname'] = "jdk1.8.0_281"
default['soa_env']['jdk']['sym_link'] = "/app/java/fmwjdk"
default['soa_env']['jdk']['lifecycle'] = "install" #install/uninstall
default['soa_env']['jdk']['tmploc'] = "/app/binaries/tmp"

default['soa_env']['fmw']['tmploc'] = "/app/binaries/tmp"
default['soa_env']['fmw']['java_home'] = "/app/java/fmwjdk"
default['soa_env']['fmw']['products'] = ["infra", "soa", "osb"] #infra/soa/osb/wls14c
#default['soa_env']['fmw']['products'] = ["wls14c"]
default['soa_env']['fmw']['lifecycle'] = "install" #install/uninstall
default['soa_env']['fmw']['inventory_loc'] = "/app/oraInventory4"
default['soa_env']['fmw']['inst_group'] = "wlapp"
default['soa_env']['fmw']['oracle_home'] = "/app/Oracle7/Middleware/Oracle_Home/"
default['soa_env']['fmw']['installer_file'] = ["/app/binaries/fmw_12.2.1.4.0_infrastructure.jar", "/app/binaries/fmw_12.2.1.4.0_soa.jar", "/app/binaries/fmw_12.2.1.4.0_osb.jar"]
#default['soa_env']['fmw']['installer_file'] = ["/app/binaries/fmw_14.1.1.0.0_wls.jar"]
#

default['soa_env']['patch']['java_home'] = "/app/java/fmwjdk"
default['soa_env']['patch']['tmploc'] = "/app/binaries/tmp"
default['soa_env']['patch']['oracle_home'] = "/app/Oracle7/Middleware/Oracle_Home/"
default['soa_env']['patch']['lifecycle'] = "apply" #apply/rollback
#default['soa_env']['patch']['file'] = ["/home/wlapp/p28186730_139425_Generic.zip", "/home/wlapp/p22526026_122140_Generic.zip", "/home/wlapp/p30741105_122140_Generic.zip", "/home/wlapp/p32121987_122140_Generic.zip", "/home/wlapp/p32124456_122140_Generic.zip", "/home/wlapp/p32253037_122140_Generic.zip", "/home/wlapp/p32337168_122140_Generic.zip"]

default['soa_env']['patch']['file'] = ["/home/wlapp/p22526026_122140_Generic.zip", "/home/wlapp/p30741105_122140_Generic.zip", "/home/wlapp/p32121987_122140_Generic.zip", "/home/wlapp/p32124456_122140_Generic.zip", "/home/wlapp/p32253037_122140_Generic.zip", "/home/wlapp/p32337168_122140_Generic.zip"]

default['soa_env']['fmw']['inst_jvm_args'] = "-Xmx1024m "


