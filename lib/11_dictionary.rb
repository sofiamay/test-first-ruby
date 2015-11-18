class Dictionary
	attr_accessor :entries

	def initialize
		@entries = {}
  	end

  	def keywords
  		@entries.keys.sort
  	end

	def add(entry)
		if entry.kind_of?(Hash)
    		entry.each do |word, desc|
      			@entries[word] = desc
    		end
    	else
    		entries[entry] = nil
    	end
  	end

  	def include?(keyword)
  		if self.keywords.include?(keyword)
  			return true
  		else
  			return false
  		end
  	end

  	def find(prefix)
  		results = {}
  		words = []
  		self.keywords.each do |key|
  			words << key if key =~ /\A#{prefix}/
  		end
  		words.each do |word|
  			results[word] = @entries[word]
  		end
  		results
  	end

  	def printable
  		result = ""

  		self.keywords.each do |word|
  			desc = @entries[word]
  			result << "[#{word}] \"#{desc}\"\n"
  		end

  		return result[0..-2] #remove last newline
  	end
 
end
