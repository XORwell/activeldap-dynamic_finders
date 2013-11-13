module LdapMacros
  #require 'ladle'
  require 'github/ldap'
  require 'github/ldap/server'

  def ldap_server_start
    #GitHub::Ldap.start_server
    #user_fixtures: File.expand_path("#{File.dirname(__FILE__)}/../fixtures/ldap.ldif"),
    GitHub::Ldap.start_server \
      user_domain: 'dc=github,dc=com',
      admin_user: 'uid=admin,dc=github,dc=com',
      admin_password: 'secret'
  end

  def ldap_server_stop
    GitHub::Ldap.stop_server
  end

  def ldap_server_restart
    ldap_server_stop
    ldap_server_start
  end


  require 'rubygems'
  require 'bundler/setup'
  require 'github/ldap'
  require 'github/ldap/server'
  # GitHub::Ldap.start_server admin_user:'admin', admin_password: 'secret'
  # GitHub::Ldap.start_server admin_user:'uid=admin,dc=github,dc=com', admin_password: 'secret'
  # ldap= GitHub::Ldap.new(port: 3897, admin_user: 'uid=admin,dc=github,dc=com', admin_password: 'secret', uid: 'uid')
  # domain = ldap.domain("dc=github,dc=com") 

end