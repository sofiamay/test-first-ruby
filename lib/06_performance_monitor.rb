#time to run a code block
def measure(num=1)
	start_time = Time.now
	num.times {yield}
	(Time.now - start_time) / num
end