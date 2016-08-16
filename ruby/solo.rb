# CAR MAKER

class Car
	attr_reader :make, :model, :type, :year
	attr_accessor :miles, :used

	# Initialized attributes (make, model, miles, type, color, year)
	def initialize (make, model, miles, type, color, year, used)
		@make = make
		@model = model
		@miles = miles
		@type = type
		@color = color
		@year = year
		@used = used
		puts "New car created."
	end

	# Method to output attributes in one call
	def about
		puts "Make: " + @make
		puts "Model: " + @model
		puts "Miles: " + @miles.to_s
		puts "Type: " + @type
		puts "Color: " + @color
		puts "Year: " + @year.to_s
		if @used
			puts "The #{@make} #{@model} is used."
		else
			puts "The #{@make} #{@model} is new"
		end
	end

	# Method to make the car drive and add miles
	def drive (miles)
		@miles += miles
		puts "The car drove " + miles.to_s + " miles."
	end

	# Method to rev the engine
	def rev_engine
		puts "VVVRRROOOMMM!!!!!! VVVVRRROOMMM!!!!!"
	end

	# Invert cars used boolean
	def used_invert
		if @used
			@used = false
		else
			@used = true
		end
	end
end

# BUSINESS LOGIC

def yes_or_no (string)
	if string == 'yes' || string == 'no'
		true
	else
		false
	end
end

def used_true_false (string)
	if string == 'yes'
		true
	else
		false
	end
end

def is_integer input
	true if Integer(input) rescue false
end

# Test Car methods

# test_car = Car.new("Audi", "A6", 19000, "Sedan", "Red", 2014, true)
# test_car.about
# test_car.rev_engine
# test_car.used_invert
# puts test_car.used
# puts test_car.drive(100)
# puts test_car.miles

# USER INTERFACE

cars = Array.new

loop do
	print "Enter the make of a new car or 'q' to stop building cars: "
	make_or_break = gets.chomp
	break if make_or_break.downcase == 'q'
	new_car_values = Hash.new
	new_car_values[:make] = make_or_break

	print "Enter the model of the car: "
	model = gets.chomp
	new_car_values[:model] = model

	print "Enter the miles of the car: "
	miles = gets.chomp
	until is_integer(miles)
		print "Enter an Integer. Enter the miles of the car: "
		miles = gets.chomp
	end
	miles.to_i
	new_car_values[:miles] = miles

	print "Enter the type of the car (SUV, Coupe, et.): "
	type = gets.chomp
	new_car_values[:type] = type

	print "Enter the color of the car: "
	color = gets.chomp
	new_car_values[:color] = color

	print "Enter the year of the car: "
	year = gets.chomp
	until is_integer(year)
		print "Enter an Integer. Enter the year of the car: "
		year = gets.chomp
	end
	year.to_i
	new_car_values[:year] = year

	print "Is the car used (yes or no)? "
	used = gets.chomp.downcase
	until yes_or_no(used)
		print "Invalid input. Is the car new or used (yes or no)? "
		used = gets.chomp.downcase
	end
	used = used_true_false(used)
	new_car_values[:used] = used

	new_car = Car.new(new_car_values[:make], new_car_values[:model], new_car_values[:miles], new_car_values[:type], new_car_values[:color], new_car_values[:year], new_car_values[:used])
	cars << new_car
end

cars.each do |car|
	puts "\nCar Instance " + (cars.index(car) + 1).to_s
	car.about
end
