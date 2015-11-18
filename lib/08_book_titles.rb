class Book
  @title

	def title
 		@title
	end

	def title=(str)
		str = str.split
   		new_string = str.map do |word|
   			if !(["the","a","an","and","in","of"].include?(word))
   				word.capitalize
   			else
   				word
   			end
   		end
   		new_string[0].capitalize!
   		@title = new_string.join(" ")
 	end
end
