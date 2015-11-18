class Timer
	attr_accessor :seconds

	def initialize
		@seconds = 0
	end

	def time_string
		seconds_digits = padded(@seconds % 60)
		minutes_digits = padded(@seconds / 60 % 60)
		hours_digits = padded(@seconds / 3600)

		return "#{hours_digits}:#{minutes_digits}:#{seconds_digits}"

	end

	#private

	def padded(num)
		if num < 10
			return "0#{num}"
		else
			return num.to_s
		end
	end
end