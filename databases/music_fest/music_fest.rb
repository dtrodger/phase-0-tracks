
require 'sqlite3'
require 'faker'


$db = SQLite3::Database.new("music_fest.db")
$db.results_as_hash = true


create_owner_table = <<-SQL
  CREATE TABLE IF NOT EXISTS owners (
    owner_id INTEGER PRIMARY KEY,
    f_name VARCHAR(255),
    l_name VARCHAR(255),
    business_name VARCHAR(255),
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


create_band_table = <<-SQL
  CREATE TABLE IF NOT EXISTS bands (
    band_id INTEGER PRIMARY KEY,
    band_name VARCHAR(255),
    manager_name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(255)
  )
 SQL

create_show_table = <<-SQL
  CREATE TABLE IF NOT EXISTS shows (
    show_id INTEGER PRIMARY KEY,
    venue_id INTEGER,
    band_id INTEGER,
    scheduled_time VARCHAR(255),
    FOREIGN KEY (venue_id) REFERENCES venue(venue_id),
    FOREIGN KEY (band_id) REFERENCES band(band_id)
  )
SQL

$db.execute(create_owner_table)
$db.execute(create_venue_table)
$db.execute(create_band_table)
$db.execute(create_show_table)

def create_owner(f_name, l_name, business_name, office_address, phone, email)
  $db.execute("INSERT INTO owners (f_name, l_name, business_name, office_address, phone, email) VALUES ('#{f_name}', '#{l_name}', '#{business_name}', '#{office_address}', '#{phone}', '#{email}')")
  puts "New owner created"
end

create_owner("Tom", "Show", "Joes Shows", "123 Apple Street", "1847-431-0970", "john@srphoto.com")

def update_owner(owner_id, f_name, l_name, business_name, office_address, phone, email)
  $db.execute("UPDATE owners SET f_name='#{f_name}', l_name='#{l_name}', business_name='#{business_name}', office_address='#{office_address}', phone='#{phone}', email='#{email}' WHERE owner_id=#{owner_id}")
  puts "#{business_name} updated"
end

update_owner(1, "Bill", "Show", "Joes Shows", "123 fake street", "1847-431-0970", "john@srphoto.com")

def delete_owner(owner_id)
  $db.execute("DELETE FROM owners WHERE owner_id = #{owner_id}")
  puts "Owner with ID #{owner_id} deleted from owners table"
end

delete_owner(1)

# def show_all_owners
#   owners = $db.execute("SELECT * FROM owners")
#   owners.each do |owner|
#    puts "\n\nID: #{owner['owner_id']}\nName: #{owner['f_name']} #{owner['l_name']}\nBusiness Name: #{owner['business_name']}\nOffice Address: #{owner['office_address']}\nPhone: #{owner['phone']}\nEmail: #{owner['email']}\n"
#   end
#   puts "End of output. If there was no output, the tables is empty."
# end

# def create_venue(venue_name, address, venue_capacity, owner_id)
#   $db.execute("INSERT INTO venues (venue_name, address, venue_capacity, owner_id) VALUES ('#{@venue_name}', '#{@address}', #{@venue_capacity}, #{@owner_id})")
#   puts "New venue created"
# end


# def update_venue(venue_id, venue_name, address, venue_capacity, owner_id)
#   $db.execute("UPDATE venues SET venue_name='#{venue_name}', address='#{address}', venue_capacity=#{venue_capacity}, owner_id=#{owner_id} WHERE venue_id=#{venue_id}")
#   puts "#{venue_name} updated"
# end

# def delete_venue(venue_id)
#   $db.execute("DELETE FROM venues WHERE venue_id = #{venue_id})")
#   puts "Venue with ID #{venue_id} deleted from venue table"
# end

# def show_all_venues
#   venues = $db.execute("SELECT * FROM venues")
#   venues.each do |venue|
#    puts "\n\nID: #{venue['venue_id']}\nVenue Name: #{venue['venue_name']}\nVenue Address: #{venue['address']}\nMax Capacity: #{venue['venue_capacity']}\nOwner ID: #{venue['owner_id']}"
#   end
#   puts "End of output. If there was no output, the tables is empty."
# end

# def create_band (band_name, manager_name, email, phone)
#   $db.execute("INSERT INTO bands (band_name, manager_name, phone, email) VALUES ('#{@band_name}', '#{@manager_name}', '#{@phone}', '#{@email}')")
#   puts "New band created"
# end

# def update_band(band_id, band_name, manager_name, email, phone)
#     $db.execute("UPDATE bands SET band_name='#{band_name}', manager_name='#{manager_name}', phone='#{phone}', email='#{email}' WHERE band_id=#{band_id}")
#     puts "#{band_name} updated"
# end

# def delete_band(band_id)
#     $db.execute("DELETE FROM bands WHERE band_id = #{band_id})")
#     puts "Band with ID #{band_id} deleted from bands table"
# end

# def show_all_bands
#   bands = $db.execute("SELECT * FROM bands")
#   bands.each do |band|
#   puts "\n\nID: #{band['band_id']}\nBand Name #{band['band_name']}\nManager: #{band['manager_name']}\nContact Email: #{band['email']}\nContact Phone: #{band['phone']}"
#   end
#   puts "End of output. If there was no output, the tables is empty."
# end

  
# def create_show (venue_id, band_id, scheduled_time)
#    $db.execute("INSERT INTO shows (venue_id, band_id, scheduled_time) VALUES (#{@venue_id}, #{@band_id}, '#{@scheduled_time}')")
#     puts "New owner created"
#   end

# def update_show(show_id, venue_id, band_id, scheduled_time)
#   $db.execute("UPDATE shows SET venue_id=#{venue_id}, band_id=#{band_id}, scheduled_time='#{scheduled_time}' WHERE show_id=#{show_id}")
#   puts "Show with id #{show_id} updated"
# end

# def delete_show(show_id)
#   $db.execute("DELETE FROM shows WHERE show_id = #{show_id})")
#   puts "Show with ID #{show_id} deleted from shows table"
# end

# def show_all_shows
#   shows = $db.execute("SELECT * FROM shows")
#   shows.each do |show|
#    puts "\n\nID: #{show['show_id']}\nVenue ID: #{show['venue_id']}\nBand ID: #{show['band_id']}\nScheduled Time: #{show['scheduled_time']}"
#   end
#   puts "End of output. If there was no output, the tables is empty."
# end

# tom.update(1, "Bill", "kill", "Joes Shows", "123dsadasdtreet", "1847-431-0970", "john@srphoto.com")

# venue1 = Venues.new("this venue", "fjdksfjsdl", 100, 1)
# venue1.update(1, "that venue", "bo", 200, 1)

# guest = Bands.new("hello", "thee", "1847-rerere", "john@srphoto.com")
# guest.update(1,"bye", "thee", "1847-rerere", "joccsdsrphoto.com")

# show = Shows.new(1, 1, "2:00PM")
# show.update(1,1,1,"$:00P:")







  



# loop do
#   puts "\nWelcome to the Music Festivle database (enter EXIT at anytime to stop the program)"
#   puts "\nThe names of tables in this database include (owners, venues, bands, shows)"
#   print "To view the contents of a table enter and gain the ability to insert and delete values from it, enter the tables name: "
#   table_name = gets.chomp

#   tables = ['owners', 'venues', 'bands', 'shows']
#   table_actions = ["VIEW", "INSERT", "DELETE"]

#   break if table_name == "EXIT"

#   until tables.include?(table_name)
#     print "INVALID INPUT - To view the contents of a table enter and gain the ability to insert and delete values from it, enter the tables name (owners, venues, bands, shows): "
#     table_name = gets.chomp
#   end

#   print "To view the contents of "+table_name+" enter VIEW, to insert a new record, enter INSERT, to delete a record, enter DELETE, to exit the program, enter EXIT: "
#   table_action = gets.chomp

#   break if table_name == "EXIT"

#   until table_actions.include?(table_action)
#     print "INVALID INPUT - To view the contents of "+table_name+" enter VIEW, to insert a new record, enter INSERT, to delete a record, enter DELETE, to exit the program, enter EXIT: "
#   table_action = gets.chomp
#   print "h1"
#   puts "FJDKLFJD"
#   end

#   if table_action == "VIEW"
#     if table_name == "owners"
#       puts "FJDKSLFJDLKS"
#       puts table_name
#       show_all_owners()
#     elsif table_name == "venues"
#       show_all_venues()
#     elsif table_name == "bands"
#       show_all_bands()
#     else
#       show_all_shows()
#     end
#   end

#   if table_action == "INSERT"
#     if table_name == "owners"
#       print "Enter venue owner first name: "
#       f_name = gets.chomp

#       print "Enter venue owner last name: "
#       l_name = gets.chomp

#       print "Enter venue business name: "
#       business_name = gets.chomp

#       print "Enter venue address: "
#       office_address = gets.chomp

#       print "Enter venue phone number: "
#       phone = gets.chomp

#       print "Enter venue email: "
#       email = gets.chomp

#       new_owner = Owners.new(f_name, l_name, business_name, office_address, phone, email)
#       OWNERS.append(new_owner)

#     end

#     if table_name == "venues"
#       print "Enter venue name: "
#       venue_name = gets.chomp

#       print "Enter venue address: "
#       address = gets.chomp

#       print "Enter venue capacity: "
#       venue_capacity = gets.chomp

#       print "Enter venue owner id: "
#       owner_id = gets.chomp

#       new_venue = Venues.new(venue_name, address, venue_capacity.to_i, owner_id.to_i)
#       VENUE.append(new_venue)

#     end

#     if table_name == "bands"
#       print "Enter band name: "
#       band_name = gets.chomp

#       print "Enter manager name: "
#       manager_name = gets.chomp

#       print "Enter band email: "
#       email = gets.chomp

#       print "Enter band phone number: "
#       phone = gets.chomp

#       new_band = Bands.new(band_name, manager_name, email, phone)
#       BANDS.append(new_band)
#     end

#     if table_name == "shows"
#       print "Enter the venue ID: "
#       venue_id = gets.chomp

#       print "Enter the band ID: "
#       band_id = gets.chomp

#       print "Enter the scheduled time: "
#       scheduled_time = gets.chomp

#       new_show = Shows.new(venue_id.to_i, band_id.to_i, scheduled_time)
#       SHOWS.append(new_show)
#     end
#   elsif table_action == "UPDATE"
#     if table_name == "owners"
#       print "Enter the owner id: "
#       owner_id = gets.chomp

#       print "Enter venue owner first name: "
#       f_name = gets.chomp

#       print "Enter venue owner last name: "
#       l_name = gets.chomp

#       print "Enter venue business name: "
#       business_name = gets.chomp

#       print "Enter venue address: "
#       office_address = gets.chomp

#       print "Enter venue phone number: "
#       phone = gets.chomp

#       print "Enter venue email: "
#       email = gets.chomp

#       new_business = Owners.new(f_name, l_name, business_name, office_address, phone, email)
#     end

#     if table_name == "venues"
#       print "Enter venue name: "
#       venue_name = gets.chomp

#       print "Enter venue address: "
#       address = gets.chomp

#       print "Enter venue capacity: "
#       venue_capacity = gets.chomp

#       print "Enter venue owner id: "
#       owner_id = gets.chomp

#       new_venue = Venues.new(venue_name, address, venue_capacity.to_i, owner_id.to_i)
#     end

#     if table_name == "bands"
#       print "Enter band name: "
#       band_name = gets.chomp

#       print "Enter manager name: "
#       manager_name = gets.chomp

#       print "Enter band email: "
#       email = gets.chomp

#       print "Enter band phone number: "
#       phone = gets.chomp

#       new_band = Bands.new(band_name, manager_name, email, phone)
#     end

#     if table_name == "shows"
#       print "Enter the venue ID: "
#       venue_id = gets.chomp

#       print "Enter the band ID: "
#       band_id = gets.chomp

#       print "Enter the scheduled time: "
#       scheduled_time = gets.chomp

#       new_show = Shows.new(venue_id.to_i, band_id.to_i, scheduled_time)
#     end
#   end
# end



# # tom = Owners.new("Bill", "Show", "Joes Shows", "123 fake street", "1847-431-0970", "john@srphoto.com")
# # tom.update(1, "Bill", "kill", "Joes Shows", "123dsadasdtreet", "1847-431-0970", "john@srphoto.com")

# # venue1 = Venues.new("this venue", "fjdksfjsdl", 100, 1)
# # venue1.update(1, "that venue", "bo", 200, 1)


# # guest.update(1,"bye", "thee", "1847-rerere", "joccsdsrphoto.com")


# # show.update(1,1,1,"$:00P:")




