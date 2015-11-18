def add(a,b)
	a + b
end

def subtract(a,b)
	a - b
end

#I looked up what ruby's version of reduce was: inject
def sum(numbers)
	numbers.inject(0) { |result, number| result + number }
end

def multiply(*numbers)
	numbers.inject(1) { |result, number| result * number }
end

def power(a, b)
	a**b
end

def factorial(num)
	(1..num).inject(1){|result, number| result * number}
end

#inject turned out to be handy! Been focusing on functional programming in js. reduce==inject

