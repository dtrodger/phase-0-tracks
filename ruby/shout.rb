module Shout
  def self.yell_angrily(words)
    words + "!!!" + " :("
  end
  def self.yelling_happily(words)
    words + "!!!" + " :)"
  end

end

puts Shout.yell_angrily("No")
puts Shout.yelling_happily("Yes")