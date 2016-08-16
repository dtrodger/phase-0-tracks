class Santa

	# defines class attributes upon initialization
	def initialize (gender, ethnicity)
		puts "Initializing Santa instance ..."
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		@age = 0
	end

	# output all class attributes
	def about (modified=false)
		if modified == true
			puts "\nSanta attributes modified. New attribute values:"
		end

		puts "Gender: " + @gender
		puts "Ethnicity: " + @ethnicity
		puts "Reindeer Ranking:"
		@reindeer_ranking.each {|reindeer| puts (@reindeer_ranking.index(reindeer) + 1).to_s + ". " + reindeer}
		puts "Age: " + @age.to_s
	end

	# modify class attributes

	# gender setter
	def gender= (new_gender)
		@gender = new_gender
		about(true)
	end

	def celebrate_birthday
		@age += 1
		about(true)
	end

	def get_mad_at (reindeer_name)
		@reindeer_ranking.delete(reindeer_name)
		@reindeer_ranking << reindeer_name
		about(true)
	end

	# output from class

	# age getter
	def age
		@age
	end

	# ethnicity getter
	def ethnicity
		@ethnicity
	end

	def speak
		puts "Ho, ho, ho! Haaaappy holidays!"
	end

	def eat_milk_and_cookies (cookie_type)
		puts "That was a good " + cookie_type
	end
end

# santas = []
# example_genders = ["female", "agender", "N/A", "female", "bigender", "male", "gender fluid"]
# example_ethnicities = ["Arab", "Azerbaijan", "Dutch", "Han Chinese", "Icelandic", "Mongolian", "Scottish"]
# example_genders.length.times {santas << Santa.new(example_genders[rand(0..example_genders.length)], example_ethnicities[rand(0..example_genders.length)])}
# santas.each {|santa| santa.about}

santa = Santa.new("Male", "American")
santa.celebrate_birthday
santa.get_mad_at("Dancer")




