class Array
	def sum
		result = self.inject(0) {|result, element| result + element}
	end

	def square
		result = self.map {|num| num * num}
	end

	def square!
		self.each_with_index do |num, index|	
			self[index] = num * num
		end
	end

end