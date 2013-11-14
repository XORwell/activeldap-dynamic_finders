module LdapMacros
  require 'github/ldap'
  require 'github/ldap/server'

  def ldap_setup
    ldap_server_start
    setup_connection
  end

  def ldap_teardown
    ldap_server_stop
  end

  def setup_connection
    ActiveLdap::Base.setup_connection YAML.load_file('spec/config/ldap.yml')['test'] 
  end

  def ldap_server_start
    GitHub::Ldap.start_server \
      user_fixtures: 'spec/fixtures/ldap.ldif',
      user_domain: 'dc=activeldap,dc=com',
      admin_user: 'cn=admin,dc=activeldap,dc=com',
      admin_password: 'secret',      
      uid: 'cn'
  end

  def ldap_server_stop
    GitHub::Ldap.stop_server
  end

  def ldap_server_restart
    ldap_server_stop
    ldap_server_start
  end

end