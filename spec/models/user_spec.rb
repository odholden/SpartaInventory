describe User do
	it "can instantiate a spartan successfully and assign attributes" do
		expect(@dummy_user.first_name).to eq "Example"
		expect(@dummy_user.last_name).to eq "User"
		expect(@dummy_user.role).to eq 0
		expect(@dummy_user.email).to eq "example@user.com"
		expect(@dummy_user.id).to eq 1
	end

	it "can use 'name' to access a full name" do
		expect(@dummy_user.name).to eq "Example User"
	end

	it "can use 'self.all' to access all users in the Identity service" do
		users = User.all
		expect(users).to be_an_instance_of(Array)
		expect(users.length).not_to be(0)
		expect(users[0].email).to be_an_instance_of(String)
	end

	it "can use 'self.find' to access one user from the Identity service" do
		user = User.find(@token_user["_id"])
		expect(user).to be_an_instance_of(User)
		expect(user.first_name).to be_an_instance_of(String)
		expect(user.name).to be_an_instance_of(String)
	end

	it "can use 'self.authenticate' to return a valid JWT token when given correct credentials" do
		token = User.authenticate(admin_email, admin_password).parsed_response["token"]
		expect(decode_jwt_token(token)["email"]).to eq admin_email
	end

	it "can use 'self.authenticate' to return a 400 error when given incorrect credentials" do
		response = User.authenticate(@dummy_user.email, "password")
		expect(response.code.to_s).to start_with "4"
	end

	before(:all) do
		@dummy_user = User.new(1, "Example", "User", 0, "example@user.com")
		@@token = IdentityFactory.get_token(admin_email, admin_password)
		@token_user = decode_jwt_token(@@token)
	end
end