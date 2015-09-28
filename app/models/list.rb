class List
	attr_reader :items

	def initialize
		@items = []
	end

	def add_suggestion(suggestion)
		@items << suggestion
	end
end
