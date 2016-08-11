## PLEASE READ! I feel like the amount of methods I am defining is overkill because the program would be shorter if I hard coded the logic in the UI seciotn, but I wanted to focus on functional decomposition. I'd appreciate if you could comment on the relevance of my methods. Would you use all the methods I wrote, or would you save some of the logic for the UI section? Thanks.


# method with a key a value and a hash as inputs and the key and value to the hash then returns the hash

def key_val_to_hash (key, value, hash)
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

# method that changes the value of a dictionary key

def key_in_dict(key, hash)
	keys = hash.keys
	if keys.include? key
		true
	else
		false
	end
end

#UI

client_hash = Hash.new

#ask user for name

print "Name: "
name = gets.chomp

client_hash = key_val_to_hash(:name, name, client_hash)

print "Age: "
age = gets.chomp

until is_integer(age)
	print "ERROR Enter an integer for age: "
	age = gets.chomp
	age
end

client_hash = key_val_to_hash(:age, age, client_hash)

# ask user for number of children

print "Number of children: "
num_child = gets.chomp

until is_integer(num_child)
	print "ERROR Enter an interger for number of children: "
	num_child = gets.chomp
	num_child
end

# ask user for a decor theme

client_hash = key_val_to_hash(:num_child, num_child, client_hash)

print "Decor theme: "
theme = gets.chomp

client_hash = key_val_to_hash(:theme, theme, client_hash)

# ask user if they have cats or dogs

print "Cats or dogs (yes or no): "
cats_or_dogs = gets.chomp
cats_or_dogs = cats_or_dogs.downcase

while true_false(cats_or_dogs) == nil
	print "ERROR Enter yes or no for cats or dogs: "
	cats_or_dogs = gets.chomp
	cats_or_dogs = cats_or_dogs.downcase
	cats_or_dogs
end

cats_or_dogs = true_false(cats_or_dogs)

client_hash = key_val_to_hash(:cats_or_dogs, cats_or_dogs, client_hash)

# ask the user if there is a fireplace

print "Fireplace (yes or no): "
fireplace = gets.chomp
fireplace = fireplace.downcase

while true_false(fireplace) == nil
	print "ERROR Enter yes or no for fireplace: "
	fireplace = gets.chomp
	fireplace = fireplace.downcase
	fireplace
end

fireplace = true_false(fireplace)

client_hash = key_val_to_hash(:fireplace, fireplace, client_hash)

# ask the user if they prefer vintage or modern

print "Vintage or modern: "
vintage_or_modern = gets.chomp

client_hash = key_val_to_hash(:vintage_or_modern, vintage_or_modern, client_hash)

# print the hash

puts "\n\nUgly printout of hash:"
puts client_hash

puts "\n\nUser frienly printout of hash:"
client_hash.each {|key, value| puts "#{key} is #{value}"}

# ask user if they want to change a hash value

loop do
	print "\n\nEnter a key name to edit the keys value or 'done' to exit: "
	key = gets.chomp

	break if key == "done"
	
	key = key.to_sym

	if key_in_dict(key, client_hash)
		print "Enter the new value: "
		new_value = gets.chomp
		key_str = key.to_s

		if key == :age || key == :num_child

			until is_integer(new_value)
				print "ERROR Enter an integer for #{key_str}'s value: "
				new_value = gets.chomp
				new_value
			end

		elsif key == :cats_or_dogs || key == :fireplace
			new_value = new_value.downcase
			print new_value
			print true_false(new_value)

			while true_false(new_value) == nil
				puts "ERROR Enter yes or no to determine #{key_str}'s value: "
				new_value = gets.chomp
				new_value = new_value.downcase
				new_value
			end

			new_value = true_false(new_value)
		end

		client_hash[key] = new_value
	else
		puts "\n\nERROR Not a valid key"
		puts "Keys Include:"
		client_hash.each_key {|key| puts key}
		redo
	end

	puts "\n\nNew hash output:"
	client_hash.each {|key, value| puts "#{key} is #{value}"}
end

















