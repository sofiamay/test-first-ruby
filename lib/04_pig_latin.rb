def translate(string)
	string = string.split(" ")

	new_string = string.map do |word|
		word = word.split("")
		#starts with a vowel
		if ["a","e","i","o","u"].include?(word[0])
			#append "ay"
			word << "ay"
		else #starts with consonant 
			count = number_of_consonants(word)
			word << word[0..count-1].join("") + "ay"
			word = word[count..-1]
		end
		word.join("")
	end
	new_string.join(" ")
end

#returns the number of leading consonants. e.g. number_of_consonants("school") = 3
def number_of_consonants(string)
	count = 0

	string.each_with_index do |letter, index|
		if !(["a","e","i","o","u"].include?(letter))
			count +=1
			#'qu' counts as 2 consonants 
			if letter=='q'
				count += 1
			end
		else
			#letter is vowel. stop counting
			break
		end
	end

	count
end

#with regex (rename as translate(string) to test)
def translate2 (string)
	string = string.split(" ")
	new_string = string.map do |word|
		#starts with a vowel
		if word =~ /\A[aeiou]/
			word += "ay"
		#starts with 'qu'
		elsif word =~ /\Aqu/
			word = word[2..-1] + "quay"
		#starts with a consonant
		else
			word.gsub(/(\A(qu|[^aeiou])+)(.*)/,'\3\1ay')
		end
	end
	new_string.join(" ")
end