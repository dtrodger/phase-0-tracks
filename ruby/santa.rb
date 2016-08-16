# SANTA MAKER

class Santa
	attr_reader :ethnicity, :reindeer_ranking
	attr_accessor :gender, :age

	# defines class attributes upon initialization
	def initialize (gender, ethnicity)
		puts "\nInitializing Santa instance ..."
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
	# def gender= (new_gender)
	# 	@gender = new_gender
	# 	about(true)
	# end

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
	# def age
	# 	@age
	# end

	# ethnicity getter
	# def ethnicity
	# 	@ethnicity
	# end

	def speak
		puts "Ho, ho, ho! Haaaappy holidays!"
	end

	def eat_milk_and_cookies (cookie_type)
		puts "That was a good " + cookie_type
	end
end

# BUSINESS LOGIC

example_genders = ["female", "agender", "N/A", "female", "bigender", "male", "gender fluid"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A", "Arab", "Azerbaijan", "Dutch", "Han Chinese", "Icelandic", "Mongolian", "Scottish"]

200.times do
	# initialize a new santa
	new_santa = Santa.new(example_genders.sample, example_ethnicities.sample)

	# set new age with random num of calls to celebrate_birthday
	# rand(0..140).times do
	# 	new_santa.celebrate_birthday
	# end

	# set new age with call to setter method
	new_santa.age = rand(0..140)

	# output attributes with calls to getter methods
	# puts "Gender: " + new_santa.gender
	# puts "Ethnicity: " + new_santa.ethnicity
	# puts "Reindeer ranking: "
	# new_santa.reindeer_ranking.each {|reindeer| puts (new_santa.reindeer_ranking.index(reindeer) + 1).to_s + ": " + reindeer}
	# puts "Age: " + new_santa.age.to_s

	# output attributes with call to about method
	new_santa.about
end




