# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

puts "iNvEsTiGaTiOn".swapcase
# => “InVeStIgAtIoN”

puts "zom".sub(/o/, "oo")
puts "zom".replace("zoom")
puts "zom".insert(1,"o")
# => “zoom”

puts "enhance".center(17)
# => "    enhance    "

puts "Stop! You’re under arrest!".upcase
puts "Stop! You’re under arrest!".tr("abcdefghijklmnopqrstuvwxyz", "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
# => "STOP! YOU’RE UNDER ARREST!"

puts "the usual" << " suspects"
puts "the usual".insert(9, " suspects")
puts "the usual".ljust(18, " suspects")
#=> "the usual suspects"

puts " suspects".rjust(18, "the usual")
puts " suspects".prepend("the usual")
# => "the usual suspects"

puts "The case of the disappearing last letter".slice(0..38)
puts "The case of the disappearing last letter".chop
puts "The case of the disappearing last letter".chomp("r")
puts "The case of the disappearing last letter".delete "r"
# => "The case of the disappearing last lette"


puts "The mystery of the missing first letter".slice(1..39)
puts "The case of the disappearing last letter".delete "T"
# => "he mystery of the missing first letter"

puts "Elementary,    my   dear        Watson!".squeeze
# => "Elementary, my dear Watson!"

puts "z".bytes
# => 122 
# 122 is an array of the bytes in z using UTF-8 encoding

puts "How many times does the letter 'a' appear in this string?".count("a")
# => 4