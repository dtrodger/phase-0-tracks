class Santa
	def initialize (gender, ethnicity)
		puts "Initializing Santa instance ..."
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		@age = 0
	end

	def about
		puts "\nGender: " + @gender
		puts "Ethnicity: " + @ethnicity
		puts "Reindeer Ranking:"
		@reindeer_ranking.each {|reindeer| puts (@reindeer_ranking.index(reindeer) + 1).to_s + ". " + reindeer}
		puts "Age: " + @age.to_s
	end

	def speak
		puts "Ho, ho, ho! Haaaappy holidays!"
	end

	def eat_milk_and_cookies (cookie_type)
		puts "That was a good " + cookie_type
	end
end

santas = []
santas << Santa.new("agender", "black")
santas << Santa.new("female", "Latino")
santas << Santa.new("bigender", "white")
santas << Santa.new("male", "Japanese")
santas << Santa.new("female", "prefer not to say")
santas << Santa.new("gender fluid", "Mystical Creature (unicorn)")
santas << Santa.new("N/A", "N/A")

santas.each {|santa| santa.about}