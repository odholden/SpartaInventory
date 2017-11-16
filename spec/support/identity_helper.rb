module IdentityHelper
	def admin_email
		ENV["IDENTITY_ADMIN_EMAIL"]
	end

	def admin_password 
		ENV["IDENTITY_ADMIN_PASSWORD"]
	end

	def decode_jwt_token token
		JWT.decode(token, nil, false)[0]
	end
end