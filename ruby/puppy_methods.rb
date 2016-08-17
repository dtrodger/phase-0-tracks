#PUPPY CLASS
class Puppy
  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(bark_num)
  	(1..bark_num).each {puts "Woof!"}
  end

  def roll_over
  	puts "*rolls over*"
  end

  def dog_years(years)
  	dog_years = years * 10
  	dog_years
  end

  def jump(feet)
  	puts "The dog jumped #{feet} feet in the air!"
  end
end

#TRAIN CLASS
class Train
	def initialize (num_riders, top_speed)
		puts "Train initialized"
		@num_riders = num_riders
		@top_speed = top_speed
	end

	def add_rider
		@num_riders += 1
		puts "There are now #{@num_riders} on the train."
	end

	def horn
		puts "CHOO CHOO!"
	end

	def top_speed
		puts "This train goes #{@top_speed}"
	end
end

#BUSINESS LOGIC
puppy = Puppy.new
puppy.fetch("ball")
puppy.speak(5)
puppy.roll_over
puts puppy.dog_years(5)
puppy.jump















