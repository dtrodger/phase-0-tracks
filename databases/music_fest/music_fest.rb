
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


loop do
  puts "\nWelcome to the Music Festivle database (enter EXIT at anytime to stop the program)"
  puts "\nThe names of tables in this database include (owner, venue, band, show)"
  print "To view the contents of a table enter and gain the ability to insert and delete values from it, enter the tables name: "
  table_name = gets.chomp

  tables = ['owners', 'venues', 'bands', 'shows']
  table_actions = ["VIEW", "INSERT", "DELETE"]

  break if table_name == "EXIT"

  until tables.include?(table_name)
    print "INVALID INPUT - To view the contents of a table enter and gain the ability to insert and delete values from it, enter the tables name (owner, venue, band, show): "
    table_name = gets.chomp
  end

  print "To view the contents of "+table_name+" enter 'VIEW'. To insert a new record, enter 'INSERT'. To delete a record, enter 'DELETE'. The access a different table, enter 'MAIN MENU'. to exit the program, enter 'EXIT': "
  table_action = gets.chomp

  break if table_action == "EXIT"

  if table_action == "MAIN MENU"
    redo
  end
end

  