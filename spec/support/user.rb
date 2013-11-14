class User < ActiveLdap::Base
  include ActiveLdap::DynamicFinders

  ldap_mapping :dn_attribute => 'cn',
               :prefix => 'ou=Users',
               :classes => ['top', 'person'],
               :scope => :one
end