def echo(string)
	string
end

def shout(string)
	string.upcase
end

def repeat(string, num=2)
	answer = []
	num.times {answer << string}
	answer.join(" ")
end

def start_of_word(string, num)
	string[0..num-1]
end

def first_word(string)
	string.split[0]
end

def titleize(string)
	string = string.split.map 
	new_string = string.map do |word|
    	if ["is","a", "and", "over", "the"].include?(word)
        	word
    	else
        	word.capitalize
    	end
	end
	new_string[0].capitalize!
	new_string.join(" ")
	

end