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
example_genders = ["female", "agender", "N/A", "female", "bigender", "male", "gender fluid"]
example_ethnicities = ["Arab", "Azerbaijan", "Dutch", "Han Chinese", "Icelandic", "Mongolian", "Scottish"]
example_genders.length.times {santas << Santa.new(example_genders[rand(0..example_genders.length)], example_ethnicities[rand(0..example_genders.length)])}
santas.each {|santa| santa.about}




