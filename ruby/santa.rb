class Santa

	def initialize ()
		puts "Initializing Santa instance ..."
	end

	def speak ()
		puts "Ho, ho, ho! Haaaappy holidays!"
	end

	def eat_milk_and_cookies (cookie_type)
		puts "That was a good " + cookie_type
	end
end

r = Santa.new
r.speak
r.eat_milk_and_cookies("Chocolate")