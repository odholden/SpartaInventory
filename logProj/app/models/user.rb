class User < ApplicationRecord
	belongs_to :returner, :class_name => 'User'
end
