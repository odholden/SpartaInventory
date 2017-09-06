class Academy < ApplicationRecord
	validates :name, presence: true
	def new
		render plain:"hello"
	end
end
