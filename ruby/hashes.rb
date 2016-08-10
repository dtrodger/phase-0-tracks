
# method with a key a value and a hash as inputs and the key and value to the hash then returns the hash

def key_vale_to_hash (key, value, hash)
	hash[key] = value
	hash
end

# method that takes a string input and returns true if it is an integer and false if it is not

def true_false (string)
	string = string.downcase

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

puts true_false("Yes")
puts true_false("No")
puts true_false("maybe")