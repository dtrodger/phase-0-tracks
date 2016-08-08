


print "What is the hamsters name? "
name = gets.chomp

print "What is the volume (1-10)? "
volume = gets.chomp

print "What is the hamsters fur color? "
fur_color = gets.chomp

print "Is the hamster a good candidate for adoption? "
good_bad = gets.chomp.upcase

until good_bad == "Yes" || good_bad == "No"
	print "Is the hamster a goof candidate for adoption? "
	good_bad = gets.chomp.downcase
end

print "Estimated age hamster age? "
age = gets.chomp

print "Name: #{name}\nVolume: #{volume}\nFur Color: #{fur_color}\nGood Candidate: #{good_bad}\nAge: #{age}"
