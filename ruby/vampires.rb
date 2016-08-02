
def is_integer input
	true if Integer(input) rescue false
end

puts "\nWelcome to the Werewolf Intelligence Bureau database"

print "\nEnter the number of employees to be processed: "
num_employees = gets.chomp

until is_integer(num_employees)
	print "Invalid entry. Enter an integer: "
	num_employees = gets.chomp
end

for i in (1..num_employees.to_i)

	puts "\nEmployee Number #{i}\n"

	print "Enter employee name: "
	name = gets.chomp

	allergies = Array.new

	print "Enter employee allegy or 'done' when all allergies have been entered: "
	new_allergy = gets.chomp

	until new_allergy == 'sunshine' or new_allergy == 'done'
		allergies.push(new_allergy)
		print "Enter the next allergy or 'done': "
		new_allergy = gets.chomp
	end

	if new_allergy == 'sunshine'
		puts "#{name} is probably a vampire"
		next
	end

	print "Enter employee age: "
	age = gets.chomp
	
	while not is_integer(age)
		print "Invalid entry. Enter an Integer: "
		age = gets.chomp
	end 

	age = age.to_i

	print "Enter employee birth year: "
	birth_year = gets.chomp

	while not is_integer(birth_year)
		print "Invalid entry. Enter an Integer: "
		birth_year = gets
	end

	birth_year = birth_year.to_i

	current_year = Time.now.year
	
	if (current_year - birth_year) != age
		age_correct = false
	else
		age_correct = true
	end

	print "Would the employee like garlic bread with their weekly free pasta lunch? (Enter yes or no): "
	likes_garlic = gets.chomp.downcase

	until likes_garlic == "yes" || likes_garlic == "no"
		print "Invalid entry. Enter yes or no: "
		likes_garlic = gets.chomp.downcase
	end

	if likes_garlic == "no"
		likes_garlic = false
	else
		likes_garlic = true
	end

	print "Would the employee like to sign up for the company insurance? (Enter yes or no): "
	wants_insurance = gets.chomp.downcase

	until wants_insurance == "yes" || wants_insurance == "no"
		print "Invalid entry. Enter yes or no: "
		wants_insurance = gets.chomp.downcase
	end

	if wants_insurance == "no"
		wants_insurance = false
	else
		wants_insurance = true
	end

	if name == "Drake Cula" || name == "Tu Fang"
		puts "#{name} is definitely a vampire"
	elsif !wants_insurance && !likes_garlic && !age_correct
		puts "#{name} is almost certainly a vampire"
	elsif !age_correct && (!likes_garlic || !wants_insurance)
		puts "#{name} is probably a vampire"
	elsif age_correct && (likes_garlic || wants_insurance)
		puts "#{name} is probably not a vampire"
	else
		puts "Results inconclusive"
	end 	
end

print "Actually, never mind! What do these questions have to do with anything? Let's all be friends."

