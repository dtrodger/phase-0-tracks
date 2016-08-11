
# method with a key a value and a hash as inputs and the key and value to the hash then returns the hash

def key_vale_to_hash (key, value, hash)
	hash[key] = value
	hash
end

# method that takes a string input and returns true if it is an integer and false if it is not

def true_false (string)
	if string == "yes"
		true
	elsif string == "no"
		false
	else
		nil
	end
end

# method that takes  string as an input and returns true if the input is yes, false if the input is no and nil if the input is neither yes or no

def is_integer input
	true if Integer(input) rescue false
end

#UI

#the clients name, age, number of children, decor theme, cats or dogs, favorite color, fireplace, vintage or modern"

client_hash = Hash.new

#ask user for name

print "Name: "
name = gets.chomp

client_hash = key_vale_to_hash(:name, name, client_hash)

print "Age: "
age = gets.chomp

until is_integer(age)
	print "(Error Enter an Integer) Age: "
	age = gets.chomp
	age
end

client_hash = key_vale_to_hash(:age, age, client_hash)

# ask user for number of children

print "Number of Children: "
num_child = gets.chomp

until is_integer(num_child)
	print "(Error Enter an Integer) Number of Children: "
	num_child = gets.chomp
	num_child
end

# ask user for a decor theme

client_hash = key_vale_to_hash(:num_child, num_child, client_hash)

print "Decor Theme: "
theme = gets.chomp

client_hash = key_vale_to_hash(:theme, theme, client_hash)

# ask user if they have cats or dogs

print "Cats or Dogs (Yes or No): "
cats_or_dogs = gets.chomp
cats_or_dogs = cats_or_dogs.downcase

while true_false(cats_or_dogs) == nil
	print "(Error Enter Yes or No) Cats or Dogs: "
	cats_or_dogs = gets.chomp
	cats_or_dogs = cats_or_dogs.downcase
	cats_or_dogs
end

cats_or_dogs = true_false(cats_or_dogs)

client_hash = key_vale_to_hash(:cats_or_dogs, cats_or_dogs, client_hash)

# ask the user if there is a fireplace

print "Fireplace (Yes or No): "
fireplace = gets.chomp
fireplace = fireplace.downcase

while true_false(fireplace) == nil
	print "(Error Enter Yes or No) Fireplace: "
	fireplace = gets.chomp
	fireplace = fireplace.downcase
	fireplace
end

fireplace = true_false(fireplace)

client_hash = key_vale_to_hash(:fireplace, fireplace, client_hash)

print "Vintage or Modern: "
vintage_or_modern = gets.chomp

client_hash = key_vale_to_hash(:vintage_or_modern, vintage_or_modern, client_hash)

puts "\n\n\nUgly printout of hash bellow"
puts client_hash

puts "\n\n\nUser frienly printout of hash bellow"
client_hash.each {|key, value| puts "#{key} is #{value}"}

keys = client_hash.keys

loop do
	puts "\n\n\nKeys Include:"
	client_hash.each_key {|key| puts key}
	print "Enter a key name to edit the value or 'done' to exit: "
	key = gets.chomp

	until keys.include? key.to_sym or key == "done"
		print "(Error Invalid Entry) Enter a key name to edit the value or 'done' to exit: "
		key = gets.chomp
	end

	if key == "done"
		break
	else
		print "Enter the new value: "
		new_value = gets.chomp
		key = key.to_sym
		client_hash[key] = new_value
	end

	puts "\n\n\nNew Values"
	client_hash.each {|key, value| puts "#{key} is #{value}"}
end








