# defines a method that check if the input can be converted into an integer
def is_integer input
	true if Integer(input) rescue false
end

puts "\nWelcome to the Werewolf Intelligence Bureau database"

print "\nEnter the number of employees to be processed: "
num_employees = gets.chomp

# asks the user to enter the number of employees to verify until they enter an integer
until is_integer(num_employees)
	print "Invalid entry. Enter an integer: "
	num_employees = gets.chomp
end

# starts a for loop that will run as many times as the user specified in num_employees
for i in (1..num_employees.to_i)

	puts "\nEmployee Number #{i}\n"

	# get employee name
	print "Enter employee name: "
	name = gets.chomp

	allergies = Array.new

	# get employee allergy
	print "Enter employee allegy or 'done' when all allergies have been entered: "
	new_allergy = gets.chomp

	# continue asking for allergies and saving them in an array until the user enters 'done' or 'sunshine'
	until new_allergy == 'sunshine' or new_allergy == 'done'
		allergies.push(new_allergy)
		print "Enter the next allergy or 'done': "
		new_allergy = gets.chomp
	end

	# if the employee is allergic to sunshine, print a message and move on to the next iteration in the for loop
	if new_allergy == 'sunshine'
		puts "#{name} is probably a vampire"
		next
	end

	# get the employees age
	print "Enter employee age: "
	age = gets.chomp
	
	# asks the user to enter their age to until they enter an integer
	while not is_integer(age)
		print "Invalid entry. Enter an Integer: "
		age = gets.chomp
	end 

	age = age.to_i

	# get the employees birth year
	print "Enter employee birth year: "
	birth_year = gets.chomp

	# asks the user to enter their birth year to until they enter an integer
	while not is_integer(birth_year)
		print "Invalid entry. Enter an Integer: "
		birth_year = gets
	end

	birth_year = birth_year.to_i

	current_year = Time.now.year
	
	# check if the employees age is the same as the current year minus the year the employee said they were born
	if (current_year - birth_year) != age
		age_correct = false
	else
		age_correct = true
	end

	# check ask the employee if they like garlic bread
	print "Would the employee like garlic bread with their weekly free pasta lunch? (Enter yes or no): "
	likes_garlic = gets.chomp.downcase

	# if the user didn't enter yes or no about the garlic bread, continue to ask them
	until likes_garlic == "yes" || likes_garlic == "no"
		print "Invalid entry. Enter yes or no: "
		likes_garlic = gets.chomp.downcase
	end

	if likes_garlic == "no"
		likes_garlic = false
	else
		likes_garlic = true
	end

	# check ask the employee if they want insurance
	print "Would the employee like to sign up for the company insurance? (Enter yes or no): "
	wants_insurance = gets.chomp.downcase

	# if the user didn't enter yes or no about insurance, continue to ask them
	until wants_insurance == "yes" || wants_insurance == "no"
		print "Invalid entry. Enter yes or no: "
		wants_insurance = gets.chomp.downcase
	end

	if wants_insurance == "no"
		wants_insurance = false
	else
		wants_insurance = true
	end

	# print a message specifying whether or not the employee is a vampire
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

