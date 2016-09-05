

# talk about Object Relational Mapping (ORM)

# require gems
require 'sqlite3'
require 'faker'

# # create SQLite3 database
db = SQLite3::Database.new("music_fest.db")
db.results_as_hash = true

# learn about fancy string delimiters

create_owner_table = <<-SQL
  CREATE TABLE IF NOT EXISTS owner (
    owner_id INTEGER PRIMARY KEY,
    f_name VARCHAR(255),
    l_name VARCHAR(255),
    office_address VARCHAR(255),
    phone VARCHAR(255),
    email VARCHAR(255)
  )
SQL

create_venue_table = <<-SQL
  CREATE TABLE IF NOT EXISTS venue (
    venue_id INTEGER PRIMARY KEY,
    venue_name VARCHAR(255),
    address VARCHAR(255),
    venue_capacity INT,
    owner_id INTEGER,
    FOREIGN KEY (owner_id) REFERENCES owner(owner_id)
  )
SQL

create_guest_table = <<-SQL
  CREATE TABLE IF NOT EXISTS guest (
    guest_id INTEGER PRIMARY KEY,
    f_name VARCHAR(255),
    l_name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(255)
  )
 SQL

create_show_table = <<-SQL
  CREATE TABLE IF NOT EXISTS show (
    show_id INTEGER PRIMARY KEY,
    venue_id INTEGER,
    guest_id INTEGER,
    band_name VARCHAR(255),
    scheduled_time VARCHAR(255),
    FOREIGN KEY (venue_id) REFERENCES venue(venue_id),
    FOREIGN KEY (guest_id) REFERENCES guest(guest_id)
  )
SQL


# create a kittens table (if it's not there already)
db.execute(create_owner_table)
db.execute(create_venue_table)
db.execute(create_guest_table)
db.execute(create_show_table)


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

# require gems
# require 'sqlite3'
# require 'faker'

# # create SQLite3 database
# db = SQLite3::Database.new("kittens.db")
# db.results_as_hash = true

# # learn about fancy string delimiters
# create_table_cmd = <<-SQL
#   CREATE TABLE IF NOT EXISTS kittens(
#     id INTEGER PRIMARY KEY,
#     name VARCHAR(255),
#     age INT
#   )
# SQL

# create a kittens table (if it's not there already)
# db.execute(create_table_cmd)

# # add a test kitten
# # db.execute("INSERT INTO kittens (name, age) VALUES ('Bob', 10)")

# # add LOOOOTS of kittens!
# # so. many. kittens. 
# #KittenExplosion
# def create_kitten(db, name, age)
#   db.execute("INSERT INTO kittens (name, age) VALUES (?, ?)", [name, age])
# end

# 10000.times do
#   create_kitten(db, Faker::Name.name, 0)
# end

# # explore ORM by retrieving data
# # kittens = db.execute("SELECT * FROM kittens")
# # kittens.each do |kitten|
# #  puts "#{kitten['name']} is #{kitten['age']}"
# # end



