
def reverseName (string)
	if string.include? " "
		split_string = string.split(" ")
		mutated_string = split_string[1] + " " + split_string[0]
		mutated_string
	else
		string
	end
end

def vowelSwitch (string)
	output = ""
	vowels = ['a','e','i','o','u']
	string.split("").each do |i|
		if vowels.include? i
			index = vowels.index(i)
			if index == 4
				index = 0
			else
				index += 1
			end
			next_vowel = vowels[index]
			output += next_vowel
		else
			output += i
		end
	end
	output
end

changed_names = []
print "Enter a name to mutate or 'quit' to stop the program: "
input = gets.chomp

until input.downcase == 'quit'
	reversed_name = reverseName(input)
	mutated_name = vowelSwitch(reversed_name)
	changed_names << input + " is actually " + mutated_name
	print "Enter a name to mutate or 'quit' to stop the program: "
	input = gets.chomp
end

changed_names.each { |name| puts name }
