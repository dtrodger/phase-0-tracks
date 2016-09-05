
require 'sqlite3'
require 'faker'


$db = SQLite3::Database.new("music_fest.db")
$db.results_as_hash = true


create_owner_table = <<-SQL
  CREATE TABLE IF NOT EXISTS owners (
    owner_id INTEGER PRIMARY KEY,
    business_name VARCHAR(255),
    f_name VARCHAR(255),
    l_name VARCHAR(255),
    office_address VARCHAR(255),
    phone VARCHAR(255),
    email VARCHAR(255)
  )
SQL


create_venue_table = <<-SQL
  CREATE TABLE IF NOT EXISTS venues (
    venue_id INTEGER PRIMARY KEY,
    venue_name VARCHAR(255),
    address VARCHAR(255),
    venue_capacity INT,
    owner_id INTEGER,
    FOREIGN KEY (owner_id) REFERENCES owner(owner_id)
  )
SQL


create_guest_table = <<-SQL
  CREATE TABLE IF NOT EXISTS guests (
    guest_id INTEGER PRIMARY KEY,
    f_name VARCHAR(255),
    l_name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(255)
  )
 SQL


create_show_table = <<-SQL
  CREATE TABLE IF NOT EXISTS shows (
    show_id INTEGER PRIMARY KEY,
    venue_id INTEGER,
    guest_id INTEGER,
    band_name VARCHAR(255),
    scheduled_time VARCHAR(255),
    FOREIGN KEY (venue_id) REFERENCES venue(venue_id),
    FOREIGN KEY (guest_id) REFERENCES guest(guest_id)
  )
SQL

$db.execute(create_owner_table)
$db.execute(create_venue_table)
$db.execute(create_guest_table)
$db.execute(create_show_table)

class Owners
  def initialize (f_name, l_name, business_name, office_address, phone, email)
    puts "hi"
    @f_name = f_name
    @l_name = l_name
    @business_name = business_name
    @office_address = office_address
    @phone = phone
    @email = email
    $db.execute("INSERT INTO owners (f_name, l_name, business_name, office_address, phone, email) VALUES ('#{@f_name}', '#{@l_name}', '#{@business_name}', '#{@office_address}', '#{@phone}', '#{@email}')")
    puts "New owner created"
  end

  def update(f_name, l_name, business_name, office_address, phone, email):
    $db.execute("UPDATE owners SET(f_name='#{@f_name}', l_name='#{@l_name}', office_address='#{@office_address}', phone='#{@phone}', email='#{@email}' WHERE business_name='#{@business_name}'")
    puts "@{business_name} updated"
  end

end

class Owners

  def initialize (f_name, l_name, office_address, phone, email)
    puts "hi"
    @f_name = f_name
    @l_name = l_name
    @office_address = office_address
    @phone = phone
    @email = email
    $db.execute("INSERT INTO owners (f_name, l_name, office_address, phone, email) VALUES ('#{@f_name}', '#{@l_name}', '#{@office_address}', '#{@phone}', '#{@email}')")
    puts "New owner created"
  end

end

# tom = Owners.new("Joe", "Show", "123 fake street", "1847-431-0970", "john@srphoto.com")

# class Owners
#   def initialize (f_name, l_name, office_address, phone, email)
#     @f_name = f_name
#     @l_name = l_name
#     @office_address = office_address
#     @phone = phone
#     @email = email
#     $db.execute("INSERT INTO owners (f_name, l_name, office_address, phone, email) VALUES (#{f_name}, #{l_name}, #{office_address}, #{phone}, #{email})")
#     puts "New owner created"
#   end
# end

# tom = Owners.new("Joe", "Show", "123 fake street", "1847-431-0970", "john@srphoto.com")

# loop do
#   print "Enter the make of a new car or 'q' to stop building cars: "
#   make_or_break = gets.chomp
#   break if make_or_break.downcase == 'q'
#   new_car_values = Hash.new
#   new_car_values[:make] = make_or_break

#   print "Enter the model of the car: "
#   model = gets.chomp
#   new_car_values[:model] = model

#   print "Enter the miles of the car: "
#   miles = gets.chomp
#   until is_integer(miles)
#     print "Enter an Integer. Enter the miles of the car: "
#     miles = gets.chomp
#   end
#   miles.to_i
#   new_car_values[:miles] = miles

#   print "Enter the type of the car (SUV, Coupe, et.): "
#   type = gets.chomp
#   new_car_values[:type] = type

#   print "Enter the color of the car: "
#   color = gets.chomp
#   new_car_values[:color] = color

#   print "Enter the year of the car: "
#   year = gets.chomp
#   until is_integer(year)
#     print "Enter an Integer. Enter the year of the car: "
#     year = gets.chomp
#   end
#   year.to_i
#   new_car_values[:year] = year

#   print "Is the car used (yes or no)? "
#   used = gets.chomp.downcase
#   until yes_or_no(used)
#     print "Invalid input. Is the car new or used (yes or no)? "
#     used = gets.chomp.downcase
#   end
#   used = used_true_false(used)
#   new_car_values[:used] = used

#   new_car = Car.new(new_car_values[:make], new_car_values[:model], new_car_values[:miles], new_car_values[:type], new_car_values[:color], new_car_values[:year], new_car_values[:used])
#   cars << new_car
# end

#   # Method to output attributes in one call
#   def about
#     puts "Make: " + @make
#     puts "Model: " + @model
#     puts "Miles: " + @miles.to_s
#     puts "Type: " + @type
#     puts "Color: " + @color
#     puts "Year: " + @year.to_s
#     if @used
#       puts "The #{@make} #{@model} is used."
#     else
#       puts "The #{@make} #{@model} is new"
#     end
#   end

#   # Method to make the car drive and add miles
#   def drive (miles)
#     @miles += miles
#     puts "The car drove " + miles.to_s + " miles."
#   end

#   # Method to rev the engine
#   def rev_engine
#     puts "VVVRRROOOMMM!!!!!! VVVVRRROOMMM!!!!!"
#   end

#   # Invert cars used boolean
#   def used_invert
#     if @used
#       @used = false
#     else
#       @used = true
#     end
#   end
# end

# # BUSINESS LOGIC

# def yes_or_no (string)
#   if string == 'yes' || string == 'no'
#     true
#   else
#     false
#   end
# end

# def used_true_false (string)
#   if string == 'yes'
#     true
#   else
#     false
#   end
# end

# def is_integer input
#   true if Integer(input) rescue false
# end


# add a test kitten
# db.execute("INSERT INTO kittens (name, age) VALUES ('Bob', 10)")

# add LOOOOTS of kittens!
# so. many. kittens. 
# KittenExplosion
# def create_kitten(db, name, age)
#   db.execute("INSERT INTO kittens (name, age) VALUES (?, ?)", [name, age])
# end

# 10000.times do
#   create_kitten(db, Faker::Name.name, 0)
# end

# explore ORM by retrieving data
# kittens = db.execute("SELECT * FROM kittens")
# kittens.each do |kitten|
#  puts "#{kitten['name']} is #{kitten['age']}"
# end

# sele# OPERATION KITTEN EXPLOSION!

# talk about Object Relational Mapping (ORM)


# Test Car methods

# test_car = Car.new("Audi", "A6", 19000, "Sedan", "Red", 2014, true)
# test_car.about
# test_car.rev_engine
# test_car.used_invert
# puts test_car.used
# puts test_car.drive(100)
# puts test_car.miles

# USER INTERFACE

# cars = Array.new

# loop do
#   print "Enter the make of a new car or 'q' to stop building cars: "
#   make_or_break = gets.chomp
#   break if make_or_break.downcase == 'q'
#   new_car_values = Hash.new
#   new_car_values[:make] = make_or_break

#   print "Enter the model of the car: "
#   model = gets.chomp
#   new_car_values[:model] = model

#   print "Enter the miles of the car: "
#   miles = gets.chomp
#   until is_integer(miles)
#     print "Enter an Integer. Enter the miles of the car: "
#     miles = gets.chomp
#   end
#   miles.to_i
#   new_car_values[:miles] = miles

#   print "Enter the type of the car (SUV, Coupe, et.): "
#   type = gets.chomp
#   new_car_values[:type] = type

#   print "Enter the color of the car: "
#   color = gets.chomp
#   new_car_values[:color] = color

#   print "Enter the year of the car: "
#   year = gets.chomp
#   until is_integer(year)
#     print "Enter an Integer. Enter the year of the car: "
#     year = gets.chomp
#   end
#   year.to_i
#   new_car_values[:year] = year

#   print "Is the car used (yes or no)? "
#   used = gets.chomp.downcase
#   until yes_or_no(used)
#     print "Invalid input. Is the car new or used (yes or no)? "
#     used = gets.chomp.downcase
#   end
#   used = used_true_false(used)
#   new_car_values[:used] = used

#   new_car = Car.new(new_car_values[:make], new_car_values[:model], new_car_values[:miles], new_car_values[:type], new_car_values[:color], new_car_values[:year], new_car_values[:used])
#   cars << new_car
# end

# cars.each do |car|
#   puts "\nCar Instance " + (cars.index(car) + 1).to_s
#   car.about
# end



