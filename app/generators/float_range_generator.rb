class FloatRangeGenerator

	PRICE = 'price'
	SPACE = 'space'

	def initialize(from, to, type=FloatRangeGenerator::PRICE)
		@from = from.to_f
		@to = to.to_f
		@type = type
	end

	def generate
		validate_from_float
		validate_to_float
	end

	def get_range
		{from: @from, to: @to}
	end

	def from
		@from
	end

	def to
		@to
	end

	private

	def validate_from_float
		@from = @from > 0.0 ? @from : 0.0
	end

	def validate_to_float
		unless @to > @from
			if @type == FloatRangeGenerator::PRICE
				@to = @from + 10000
			else
				@to = @from + 50
			end
		end
	end

end