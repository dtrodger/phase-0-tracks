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
end

puppy = Puppy.new
puppy.fetch("ball")
puppy.speak(5)
puppy.roll_over
puts puppy.dog_years(5)

