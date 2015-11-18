def reverser
	string = yield.split.map do |word|
		word.reverse
	end
	string.join(" ")
end

def adder(num=1)
	yield + num
end

def repeater(num=1)
	num.times do
		yield
	end
end