shared_context "ldap" do
	before(:all) do
		ldap_server_start
	end

	after(:all) do
		ldap_server_stop
	end
	
end