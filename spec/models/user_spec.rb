describe User do
	it "can instantiate a spartan successfully and assign attributes" do
		expect(@dummy_user.first_name).to eq("Example")
		expect(@dummy_user.last_name).to eq("User")
		expect(@dummy_user.role).to eq(0)
		expect(@dummy_user.email).to eq("example@user.com")
		expect(@dummy_user.id).to eq(1)
	end

	it "can use 'name' to access a full name" do
		expect(@dummy_user.name).to eq("Example User")
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
	end

	it "cannot use 'self.find' to return a user when an incorrect id is given" do
		user = User.find(0)
		expect(user).to be(nil)
	end

	it "can use 'self.find_by_role' to access all the spartan users" do
		users = User.find_by_role(0)
		expect(users).to be_an_instance_of(Array)
		expect(users[0]).to be_an_instance_of(User)
		expect(users[0].email).to be_an_instance_of(String)
	end	

	it "can use 'self.find_by_role' to access all the client users" do
		users = User.find_by_role(1)
		expect(users).to be_an_instance_of(Array)
		expect(users[0]).to be_an_instance_of(User)
		expect(users[0].email).to be_an_instance_of(String)
	end	

	it "can use 'self.find_by_role' to access all the instructor users" do
		users = User.find_by_role(2)
		expect(users).to be_an_instance_of(Array)
		expect(users[0]).to be_an_instance_of(User)
		expect(users[0].email).to be_an_instance_of(String)
	end

	it "cannot use 'self.find_by_role' to access users when an incorrect role number is given" do
		users = User.find_by_role(5)
		expect(users).to be_an_instance_of(Array)
	end

	it "can use 'self.authenticate' to return a valid JWT token when given correct credentials" do
		token = User.authenticate(admin_email, admin_password).parsed_response["token"]
		expect(decode_jwt_token(token)["email"]).to eq(admin_email)
	end

	it "can use 'self.authenticate' to return a 400 error when given incorrect credentials" do
		response = User.authenticate(@dummy_user.email, "password")
		expect(response.code.to_s).to start_with("4")
	end

	it "can use 'self.bind_array' to attach data from a HTTParty response to User objects" do
		response = IdentityFactory.get_all_users(admin_email, admin_password)
		result = User.bind_array(response)
		expect(result).to be_an_instance_of(Array)
		expect(result[0]).to be_an_instance_of(User) 
	end

	it "can use 'self.bind' to creata a user object from HTTParty response data" do
		response = IdentityFactory.get_one_user(admin_email, admin_password, @token_user["_id"])
		user = User.bind(response)
		expect(user).to be_an_instance_of(User)
		expect(user.email).to be_an_instance_of(String)
	end

	before(:all) do
		@dummy_user = User.new(1, "Example", "User", 0, "example@user.com")
		@@token = IdentityFactory.get_token(admin_email, admin_password)
		@token_user = decode_jwt_token(@@token)
	end
end