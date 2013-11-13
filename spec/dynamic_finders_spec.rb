require 'spec_helper'

describe ActiveLdap::DynamicFinders do

  let!(:model){
    class User
      include ActiveLdap::DynamicFinders
    end
  }

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

  it { expect(domain.valid_login?('calavera', 'secret')).not_to be_nil }
  it { expect(domain.valid_login?('ldaptest', 'secret')).not_to be_nil }

  
  describe '.respond_to?' do
    it { expect(model).to respond_to('respond_to?')}
    context "dynamic finders" do
      [:find_by_mail, :find_by_dn, :find_by_ThisShouldAlsoDo, :find_by_by_by, :find_by_me_and_you].each{ |finder|
        it "does respond to any find_by prefixed methods: #{finder}" do
          expect(model.respond_to?(finder)).to be_true
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