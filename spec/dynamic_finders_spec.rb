require 'spec_helper'

describe ActiveLdap::DynamicFinders do

  let!(:al_class){ require 'active_ldap'; class ActiveLdapUser < ActiveLdap::Base; include ActiveLdap::DynamicFinders end }
  let!(:not_al_class){ class User; include ActiveLdap::DynamicFinders end }
 
  # include_context "ldap"

  # let!(:domain){ 

  #   # FIXME: use tls
  #   GitHub::Ldap.new(
  #     port: 3897,
  #     admin_user: 'uid=admin,dc=github,dc=com',
  #     admin_password: 'secret',
  #     uid: 'uid'
  #   ).domain("dc=github,dc=com") 
  # }

  # it { expect(domain.valid_login?('calavera', 'secret')).not_to be_nil }
  # it { expect(domain.valid_login?('ldaptest', 'secret')).not_to be_nil }

  
  describe '.respond_to?' do
    context "dynamic finders" do
      [:find_by_mail, :find_by_me_and_you].each{ |finder|
        context 'ActiveLdap::Base inherited class' do
          it "does respond to any find_by prefixed methods: #{finder}" do
            expect(al_class.respond_to?(finder)).to be_true
          end
        end
        context 'Not ActiveLdap::Base inherited class' do
          it "does NOT respond to any find_by prefixed methods: #{finder}" do
            expect(not_al_class.respond_to?(finder)).to be_false
          end
        end
      }
    end
  end

  describe 'run_find_by_method' do
  end
  describe 'method_missing' do
  end

  # describe 'dynamic finders' do
  #   context "ldap" do
  #   end
  # end

end