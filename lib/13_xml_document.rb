#this was a little tricky!

class XmlDocument
  def initialize(indent=false)
  	@indent = indent
  	@indent_level = 0
  end

 	def method_missing(m, *args, &block)
	  	xml_string = ""

	  	attributes = ""
	  	if args[0].is_a?(Hash)
	  		args[0].each do |key, value|
	  			attributes << " #{key}=\"#{value}\""
	  		end
	  	end


	  	if block
	  		if @indent #increase indent level
	  			xml_string << "#{"  " * @indent_level}<#{m}>\n" #increase indent level
	  			@indent_level += 1
	  			xml_string << "#{yield}" 
	  			@indent_level -= 1
	  			xml_string << "#{"  " * (@indent_level)}</#{m}>\n"
	  		else
	  			xml_string << "<#{m}>#{yield}</#{m}>"
	  		end
	  	else
	  		if @indent
	  			xml_string << "#{"  " * @indent_level}<#{m}#{attributes}/>\n"
	  		else
	  			xml_string << "<#{m}#{attributes}/>"
	  		end
	  	end
	  	xml_string
  	end



end
