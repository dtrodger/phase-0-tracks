
print "What is the hamsters name: "
name = gets.chomp

print "What is the volume (1-10) "
volume = gets.chomp

print "What is the fur color? "
fur_color = gets.chomp

print "Good candidate for adoption (Good Bad): "
good_bad_candidate = gets.chomp

print "Estimated age: "
age = gets.chomp

if age == ""
	age = nil
else
	age = age.to_i
end