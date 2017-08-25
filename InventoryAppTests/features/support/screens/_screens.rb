class Screens

	def login
		@login ||= Login.new
	end

	def logs
		@logs ||= Logs.new
	end

	def items
		@items ||= Items.new
	end

end
