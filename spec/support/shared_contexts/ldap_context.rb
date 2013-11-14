shared_context "ldap" do
  
	before(:all) do
		ldap_setup
	end

	after(:all) do
		ldap_teardown
	end
	
end