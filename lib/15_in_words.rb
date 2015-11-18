
#A lot of code repitition. Recursive solution would be better.
class Fixnum
	def in_words
		num = self
		result = ""
		@@single_digits = { 0=>"zero", 1=>"one", 2=>"two", 3=>"three", 4=>"four", 5=>"five", 6=>"six", 7=>"seven", 8=>"eight", 9=>"nine" }
		@@teens = { 10=>"ten", 11=>"eleven", 12=>"twelve", 13=>"thirteen", 14=>"fourteen", 15=>"fifteen", 16=>"sixteen", 17=>"seventeen", 18=>"eighteen", 19=>"nineteen"}
		@@tens_place = { 2=>"twenty", 3=>"thirty", 4=>"forty", 5=>"fifty", 6=>"sixty", 7=>"seventy", 8=>"eighty", 9=>"ninety"}

		def less_than_a_hundred(num)
			result = ""
			if num < 10
				result << @@single_digits[num]
			elsif num >= 10 && num < 20
				result << @@teens[num]
			else #num > 10 and < 100
				result << @@tens_place[(num/10)]
				result << " #{@@single_digits[num%10]}" if num%10 != 0
			end
			return result
		end

		def less_than_a_thousand(num)
			result = ""
			if num >= 100
				result = @@single_digits[num/100] + " hundred"
				result << " " + less_than_a_hundred(num%100) if num%100 != 0
			else #num <100
				result = less_than_a_hundred(num)
			end
			return result
		end



		#trillions
		if num >= 1_000_000_000_000
			trillions = num / 1_000_000_000_000
			result << "#{less_than_a_thousand(trillions)} trillion"
			if num % 1_000_000_000_000 == 0
				return result
			else
				result << " "
				num = num % 1_000_000_000_000
			end
		end

		#billions
		if num >= 1_000_000_000
			billions = num / 1_000_000_000
			result << "#{less_than_a_thousand(billions)} billion"
			if num % 1_000_000_000 == 0
				return result
			else
				result << " "
				num = num % 1_000_000_000
			end
		end

		#millions
		if num >= 1_000_000
			millions = num / 1_000_000
			result << "#{less_than_a_thousand(millions)} million"
			if num % 1_000_000 == 0
				return result
			else
				result << " "
				num = num % 1_000_000

			end
		end

		#thousands
		if num >= 1000
			thousands = num / 1000
			result << "#{less_than_a_thousand(thousands)} thousand"
			if num % 1000 == 0
				return result
			else
				result << " "
				num = num % 1000
			end
		end

		#less than a thousand
		if num < 1000
			result << less_than_a_thousand(num)
		end


		return result
	end
end



			# def less_than_a_million(num)
			# 	result = ""
			# 	if num >= 1000
			# 		result = less_than_a_hundred(num/1000) + " thousand" 
			# 		result << (" " + less_than_a_thousand(num%1000)) if num%1000 != 0
			# 		result
			# 	else
			# 		result = less_than_a_thousand(num) if num%1000 != 0
			# 	end
			# 	return result
			# end

			# def less_than_a_billion(num) #100,000,000
			# 	result = less_than_a_hundred(num/1000000) + " million"
			# 	if num%1000000 != 0
			# 		result << "#{less_than_a_million(num%1000000)}"
			# 	end
			# 	result
			# end