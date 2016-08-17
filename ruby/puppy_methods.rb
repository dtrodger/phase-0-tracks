class Puppy

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

end

puppy = Puppy.new
puppy.fetch("Ball")

