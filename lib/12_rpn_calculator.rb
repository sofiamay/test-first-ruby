
#There is a lot of repitition in the methods for each operator. Would be better to put that functionality into a single method called eval with a case for each operator
class RPNCalculator
	def initialize
  		@stack = []
  	end

	def push(num)
  		@stack << num
  	end

  	def plus
  		if @stack.size >= 2
	  		b = @stack.pop
	  		a = @stack.pop
	  		@stack.push(a + b)
	  	else
	  		raise "calculator is empty"
	  	end
  	end

  	def minus
  		if @stack.size >= 2
	  		b = @stack.pop
	  		a = @stack.pop
	  		@stack.push(a - b)
	  	else
	  		raise "calculator is empty"
	  	end
  	end

  	def divide
  		if @stack.size >= 2
	  		b = @stack.pop.to_f
	  		a = @stack.pop
	  		@stack.push(a / b)
	  	else
	  		raise "calculator is empty"
	  	end
  	end

  	def times
	  	if @stack.size >= 2
	  		b = @stack.pop
	  		a = @stack.pop
	  		@stack.push(a * b)
	  	else
	  		raise "calculator is empty"
	  	end

  	end

  	def value
  		value = @stack[-1]
  	end

  	def tokens(string)
  		tokenized = string.split(" ")
  		results = tokenized.map do |token|
  			if ['+','-','*','/'].include?(token)
  				token.to_sym
  			else
  				token.to_i
  			end
  		end
  		results
  	end

  	def evaluate(string)
  		tokens(string).each do |token|
  			case token
  			when :+
  				self.plus
  			when :-
  				self.minus
  			when :*
  				self.times
  			when :/
  				self.divide
  			else
  				self.push(token)
  			end
  		end
  		self.value
  	end

end

