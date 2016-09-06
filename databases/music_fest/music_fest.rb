
require 'sqlite3'
require 'faker'


$db = SQLite3::Database.new("music_fest.db")
$db.results_as_hash = true


create_owner_table = <<-SQL
  CREATE TABLE IF NOT EXISTS owner (
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
  CREATE TABLE IF NOT EXISTS venue (
    venue_id INTEGER PRIMARY KEY,
    venue_name VARCHAR(255),
    address VARCHAR(255),
    venue_capacity INT,
    owner_id INTEGER,
    FOREIGN KEY (owner_id) REFERENCES owner(owner_id)
  )
SQL


create_band_table = <<-SQL
  CREATE TABLE IF NOT EXISTS band (
    band_id INTEGER PRIMARY KEY,
    band_name VARCHAR(255),
    manager_name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(255)
  )
 SQL

create_show_table = <<-SQL
  CREATE TABLE IF NOT EXISTS show (
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

def delete_record(table, id)
  $db.execute("DELETE FROM #{table} WHERE #{table}_id = #{id}")
end

def create_owner(f_name, l_name, business_name, office_address, phone, email)
  $db.execute("INSERT INTO owner (f_name, l_name, business_name, office_address, phone, email) VALUES ('#{f_name}', '#{l_name}', '#{business_name}', '#{office_address}', '#{phone}', '#{email}')")
end

def update_owner(owner_id, f_name, l_name, business_name, office_address, phone, email)
  $db.execute("UPDATE owner SET f_name='#{f_name}', l_name='#{l_name}', business_name='#{business_name}', office_address='#{office_address}', phone='#{phone}', email='#{email}' WHERE owner_id=#{owner_id}")
end

def show_all_owners
  owners = $db.execute("SELECT * FROM owner")
  if owners.any?
    owners.each do |owner|
     puts "\nID: #{owner['owner_id']}\nName: #{owner['f_name']} #{owner['l_name']}\nBusiness Name: #{owner['business_name']}\nOffice Address: #{owner['office_address']}\nPhone: #{owner['phone']}\nEmail: #{owner['email']}\n"
    end
  else
    puts "\nThe owner table is empty."
  end
end

create_owner("Bill", "Show", "Joes Shows", "123 fake street", "1847-431-0970", "john@srphoto.com")
# show_all_owners()
update_owner(1,"vill", "Show", "Joesvdvs", "123 fake street", "1847-431-0970", "john@srphoto.com")
# show_all_owners()

def create_venue(venue_name, address, venue_capacity, owner_id)
  $db.execute("INSERT INTO venue (venue_name, address, venue_capacity, owner_id) VALUES ('#{venue_name}', '#{address}', #{venue_capacity}, #{owner_id})")
end

def update_venue(venue_id, venue_name, address, venue_capacity, owner_id)
  $db.execute("UPDATE venue SET venue_name='#{venue_name}', address='#{address}', venue_capacity=#{venue_capacity}, owner_id=#{owner_id} WHERE venue_id=#{venue_id}")
end

def show_all_venues
  venues = $db.execute("SELECT * FROM venue")
  if venues.any?
    venues.each do |venue|
     puts "\n\nID: #{venue['venue_id']}\nVenue Name: #{venue['venue_name']}\nVenue Address: #{venue['address']}\nMax Capacity: #{venue['venue_capacity']}\nOwner ID: #{venue['owner_id']}"
    end
  else
    puts "\nThe venue table is empty."
  end
end

create_venue("this venue", "123 street", 100, 1)
# show_all_venues()
update_venue(1, "that venue", "888 street", 200, 1)
# show_all_venues()
# delete_record("venue", 1)
# show_all_venues()

def create_band (band_name, manager_name, email, phone)
  $db.execute("INSERT INTO band (band_name, manager_name, phone, email) VALUES ('#{band_name}', '#{manager_name}', '#{phone}', '#{email}')")
end

def update_band(band_id, band_name, manager_name, email, phone)
    $db.execute("UPDATE band SET band_name='#{band_name}', manager_name='#{manager_name}', phone='#{phone}', email='#{email}' WHERE band_id=#{band_id}")
    puts "#{band_name} updated"
end

def show_all_bands
  bands = $db.execute("SELECT * FROM band")
  if bands.any?
    bands.each do |band|
    puts "\n\nID: #{band['band_id']}\nBand Name #{band['band_name']}\nManager: #{band['manager_name']}\nContact Email: #{band['email']}\nContact Phone: #{band['phone']}"
    end
  else
    puts "\nThe band table is empty."
  end
end

create_band("hello", "tom b", "john@srphoto.com", "1847-431-0970")
update_band(1, "bye", "tom b", "john@srphoto.com", "1847-431-0970")
  
def create_show (venue_id, band_id, scheduled_time)
   $db.execute("INSERT INTO show (venue_id, band_id, scheduled_time) VALUES (#{venue_id}, #{band_id}, '#{scheduled_time}')")
    puts "New owner created"
  end

def update_show(show_id, venue_id, band_id, scheduled_time)
  $db.execute("UPDATE show SET venue_id=#{venue_id}, band_id=#{band_id}, scheduled_time='#{scheduled_time}' WHERE show_id=#{show_id}")
  puts "Show with id #{show_id} updated"
end

def show_all_shows
  shows = $db.execute("SELECT * FROM show")
  if shows.any?
    shows.each do |show|
     puts "\n\nID: #{show['show_id']}\nVenue ID: #{show['venue_id']}\nBand ID: #{show['band_id']}\nScheduled Time: #{show['scheduled_time']}"
    end
  else
    puts "\nThe show table is empty."
  end
end

create_show(1, 1, "2:00PM")
show_all_shows()
update_show(1,1,1,"3:00P:")
show_all_shows()
delete_record("show",1)
show_all_shows()







  



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




