# module Shout
#   def self.yell_angrily(words)
#     words + "!!!" + " :("
#   end
#   def self.yelling_happily(words)
#     words + "!!!" + " :)"
#   end

# end

# puts Shout.yell_angrily("No")
# puts Shout.yelling_happily("Yes")


module Shout
	def yell_angrily(words)
		words + "!!!" + " >:("
	end
	def yell_happily(words)
		words + "!!" + " :)"
	end
end


class Parent
	include Shout
end
class Kid
	include Shout
end

John = Parent.new
Jill = Kid.new
puts John.yell_angrily("Go to bed")
puts Jill.yell_happily("I want dessert")