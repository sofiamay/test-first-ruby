class Temperature
 	def initialize(options={})
  		@f = options[:f]
  		@c = options[:c]
  	end

  	def self.from_celsius(temp)
  		Temperature.new(c: temp)
  	end

  	def self.from_fahrenheit(temp)
  		Temperature.new(f: temp)
  	end

  	def in_fahrenheit
  		if @f
  			return @f
  		else
  			@f = @c * (9.0/5) + 32
  		end
  	end

  	def in_celsius
  		if @c
  			return @c
  		else
  			@c = (@f - 32) * (5.0/9)
  		end
  	end

end

class Celsius < Temperature  
	def initialize(num)
		super(c: num)
	end
end

class Fahrenheit < Temperature 
	def initialize(num)
		super(f: num)
	end
end
