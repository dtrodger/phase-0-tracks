class Puppy
  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(bark_num)
  	(1..bark_num).each {puts "Woof!"}
  end
end

puppy = Puppy.new
puppy.fetch("ball")
puppy.speak(5)

