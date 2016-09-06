
require 'sqlite3'
require 'faker'

# SQL CREATING TABLES

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


# SQL VIEWING, UPDATING, ADDING, DELETING RECORDS

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


def show_table_records(table_name)
  if table_name == "owner"
    show_all_owners()
  elsif table_name == "venue"
    show_all_venues()
  elsif table_name == "band"
    show_all_bands()
  else
    show_all_shows()
  end
end

create_owner("Bill", "Smith", "Bills Promotions", "123 Fake Street", "1-847-431-0970", "bill@bpromo.com")
create_owner("Jill", "Hoover", "JHT", "88 Street", "1-312-443-2293", "jill@srp.com")

create_venue("Rock House", "66 Oak Street", 100, 1)
create_venue("Jump Street", "463 Elm", 150, 2)
create_venue("Dance Dance Dance", "93 MIllman Street", 400, 1)

create_band("RJD2", "Bob Thron", "312-003-0229", "joccs@to.com")
create_band("Smooth Hits", "Bono", "312-123-2329", "hi@there.com")

#UI

puts "\nWelcome to the Music Festivle database (enter EXIT at anytime to stop the program)"
loop do
  puts "\n----------MAIN MENU----------"
  puts "\nThe names of tables in this database include (owner, venue, band, show)"
  print "To view the contents of a table enter and gain the ability to insert and delete values from it, enter the tables name or 'view all' to view the records in every table: "
  table_name = gets.chomp

  tables = ['owner', 'venue', 'band', 'show','view all', 'EXIT']
  table_actions = ["VIEW", "INSERT", "DELETE", "EXIT"]

  until tables.include?(table_name)
    print "\nINVALID INPUT - To view the contents of a table enter and gain the ability to insert and delete values from it, enter the tables name (owner, venue, band, show): "
    table_name = gets.chomp
  end

  break if table_name == "EXIT"

  if table_name == 'view all'
    puts "Owner Table"
    show_all_owners()
    puts "\nVenue Table"
    show_all_venues()
    puts "\nBand Table"
    show_all_bands()
    puts "\nShow Table"
    show_all_shows()
    redo
  end

  print "\nTo view the contents of "+table_name+" enter 'VIEW'. To insert a new record, enter 'INSERT'. To update a record, enter 'UPDATE'. To delete a record, enter 'DELETE'. The access a different table, enter 'MAIN MENU'. to exit the program, enter 'EXIT': "
  table_action = gets.chomp

  until table_action.include?(table_action)
    print "\nINVALID INPUT - To view the contents of "+table_name+" enter 'VIEW'. To insert a new record, enter 'INSERT'. To update a record, enter 'UPDATE'. To delete a record, enter 'DELETE'. The access a different table, enter 'MAIN MENU'. to exit the program, enter 'EXIT': "
    table_name = gets.chomp
  end

  break if table_action == "EXIT"

  if table_action == "MAIN MENU"
    redo

  elsif table_action == "VIEW"
    show_table_records(table_name)

  elsif table_action == "INSERT"
    if table_name == "owner"
      print "Enter the venue owner first name: "
      f_name = gets.chomp

      print "Enter venue owner last name: "
      l_name = gets.chomp

      print "Enter venue business name: "
      business_name = gets.chomp

      print "Enter venue address: "
      office_address = gets.chomp

      print "Enter venue phone number: "
      phone = gets.chomp

      print "Enter venue email: "
      email = gets.chomp

      create_owner(f_name, l_name, business_name, office_address, phone, email)
      puts "New record added to owner"

    elsif table_name == "venue"
      owner_ids = $db.execute("SELECT * FROM owner")
      ids = []
      owner_ids.each do |owner|
        ids << owner['owner_id']
      end
      if not ids.any?
        puts "\nNo owners exist in the database. You cannot INSERT a venue without an owner to associate to it with as a foriegn key. INSERT an onwer into the database from the MAIN MENU, then use that owner's ID as the owner_id while INSERTING a venue"
        redo
      else
        print "Enter venue name: "
        venue_name = gets.chomp

        print "Enter venue address: "
        address = gets.chomp

        print "Enter venue capacity: "
        venue_capacity = gets.chomp

        puts "Enter an owner_id that exists in the database. Reference the following list:"
        ids.each do |id|
          puts "Owner ID #{id}"
        end
        print "Enter a venue owner ID: "
        owner_id = gets.chomp.to_i
        until ids.include?(owner_id)
          puts "INVALID ENTRY - Enter an owner_id that exists in the database. Reference the following list:"
          ids.each do |id|
            puts "Owner ID #{id}"
          end
          print "Enter a venue owner ID: "
          owner_id = gets.chomp.to_i
        end
        create_venue(venue_name, address, venue_capacity.to_i, owner_id)
        puts "New record added to venue table"
      end
    elsif table_name == "band"
        print "Enter band name: "
        band_name = gets.chomp

        print "Enter manager name: "
        manager_name = gets.chomp

        print "Enter band email: "
        email = gets.chomp

        print "Enter band phone number: "
        phone = gets.chomp

        create_band(band_name, manager_name, email, phone)
        puts "New record added to band table"
    elsif table_name == "show"
      venues = $db.execute("SELECT * FROM venue")
      v_ids = []
      venues.each do |venue|
        v_ids << venue['venue_id']
      end
      bands = $db.execute("SELECT * FROM band")
      b_ids = []
      bands.each do |band|
        b_ids << band['band_id']
      end
      if not v_ids.any?
        puts "\nNo venues exist in the database. You cannot INSERT a show without a venue to associate to it with as a foriegn key. INSERT a venue into the database from the MAIN MENU, then use that venue's ID as the venue_id while INSERTING a show"
        redo
      elsif not b_ids.any?
        puts "\nNo bands exist in the database. You cannot INSERT a show without a band to associate to it with as a foriegn key. INSERT a band into the database from the MAIN MENU, then use that band's ID as the band_id while INSERTING a show"
        redo
      else
        puts "Enter an venue_id that exists in the database. Reference the following list:"
        v_ids.each do |id|
          puts "Venue ID #{id}"
        end
        print "Enter a venue ID: "
        venue_id = gets.chomp.to_i
        until v_ids.include?(venue_id)
          puts "INVALID ENTRY - Enter an venue_id that exists in the database. Reference the following list:"
          v_ids.each do |id|
            puts "Venue ID #{id}"
          end
          print "Enter a venue ID: "
          venue_id = gets.chomp.to_i
        end

        puts "Enter an band_id that exists in the database. Reference the following list:"
        b_ids.each do |id|
          puts "Band ID #{id}"
        end
        print "Enter a band ID: "
        band_id = gets.chomp.to_i
        until b_ids.include?(band_id)
          puts "INVALID ENTRY - Enter an band_id that exists in the database. Reference the following list:"
          b_ids.each do |id|
            puts "Band ID #{id}"
          end
          print "Enter a band ID: "
          band_id = gets.chomp.to_i
        end

        print "Enter the scheduled time: "
        scheduled_time = gets.chomp

        create_show(venue_id, band_id, scheduled_time)
        puts "New record added to show table"
      end
    end
  elsif table_action == "UPDATE"
    if table_name == "owner"
      owners = $db.execute("SELECT * FROM owner")
      o_ids = []
      owners.each do |owner|
        o_ids << owner['owner_id']
      end
      if not o_ids.any?
        puts "\nNo owners exist in the database so nothing can be updated. If you would like to add an owner navigate to the INSERT function in the owner section."
        redo
      else
        o_ids.each do |id|
          puts "Owner ID #{id}"
        end
        print "Enter an owner_id of the owner record to UPDATE: "
        owner_id = gets.chomp.to_i

        until o_ids.include?(owner_id)
          puts "INVALID ENTRY"
          o_ids.each do |id|
          puts "Owner ID #{id}"
          end
          print "Enter an owner_id of the owner record to UPDATE: "
          owner_id = gets.chomp.to_i
        end
        
        print "Enter the venue owner first name: "
        f_name = gets.chomp

        print "Enter venue owner last name: "
        l_name = gets.chomp

        print "Enter venue business name: "
        business_name = gets.chomp

        print "Enter venue address: "
        office_address = gets.chomp

        print "Enter venue phone number: "
        phone = gets.chomp

        print "Enter venue email: "
        email = gets.chomp

        update_owner(owner_id, f_name, l_name, business_name, office_address, phone, email)
        puts "Record in owner table updated"
      end
    elsif table_name == "venue"
      venues = $db.execute("SELECT * FROM venue")
      v_ids = []
      venues.each do |venue|
        v_ids << venue['venue_id']
      end
      if not v_ids.any?
        puts "\nNo venues exist in the database so nothing can be updated. If you would like to add a venue navigate to the INSERT function in the venue section."
        redo
      else
        v_ids.each do |id|
          puts "Venue ID #{id}"
        end
        print "Enter an venue_id of the venue record to UPDATE: "
        venue_id = gets.chomp.to_i

        until v_ids.include?(venue_id)
          puts "INVALID ENTRY"
          v_ids.each do |id|
          puts "Venue ID #{id}"
          end
          print "Enter a venue_id of the venue record to UPDATE: "
          venue_id = gets.chomp.to_i
        end
        print "Enter venue name: "
        venue_name = gets.chomp

        print "Enter venue address: "
        address = gets.chomp

        print "Enter venue capacity: "
        venue_capacity = gets.chomp

        owners = $db.execute("SELECT * FROM owner")
        o_ids = []

        owners.each do |owner|
          o_ids << owner['owner_id']
        end

        puts "Enter an owner_id that exists in the database. Reference the following list:"

        o_ids.each do |id|
          puts "Owner ID #{id}"
        end

        print "Enter an owner_id: "
        owner_id = gets.chomp.to_i

        until o_ids.include?(owner_id)
          puts "INVALID ENTRY - Enter an owner_id that exists in the database. Reference the following list:"
          
          o_ids.each do |id|
            puts "Owner ID #{id}"
          end
          
          print "Enter an owner_id: "
          owner_id = gets.chomp.to_i
        end
        
        update_venue(venue_id, venue_name, address, venue_capacity, owner_id)
        puts "Record in venue table updated"
      end
    elsif table_name == "band"
      bands = $db.execute("SELECT * FROM band")
      b_ids = []
      bands.each do |band|
        b_ids << band['band_id']
      end
      if not b_ids.any?
        puts "\nNo bands exist in the database so nothing can be updated. If you would like to add a band navigate to the INSERT function in the band section."
        redo
      else
        b_ids.each do |id|
          puts "Band ID #{id}"
        end
        print "Enter an band_id of the band record to UPDATE: "
        band_id = gets.chomp.to_i

        until b_ids.include?(band_id)
          puts "INVALID ENTRY"
          b_ids.each do |id|
          puts "Band ID #{id}"
          end
          print "Enter a band_id of the band record to UPDATE: "
          band_id = gets.chomp.to_i
        end

        print "Enter band name: "
        band_name = gets.chomp

        print "Enter manager name: "
        manager_name = gets.chomp

        print "Enter band email: "
        email = gets.chomp

        print "Enter band phone number: "
        phone = gets.chomp

        update_band(band_id, band_name, manager_name, email, phone)
        puts "New record added to band table"
      end
    elsif table_name == "show"
      shows = $db.execute("SELECT * FROM show")
      s_ids = []
      shows.each do |show|
        s_ids << show['show_id']
      end
      if not s_ids.any?
        puts "\nNo shows exist in the database so nothing can be updated. If you would like to add a show, navigate to the INSERT function in the show section."
        redo
      else
        s_ids.each do |id|
          puts "Show ID #{id}"
        end
        print "Enter an show_id of the show record to UPDATE: "
        show_id = gets.chomp.to_i

        until s_ids.include?(show_id)
          puts "INVALID ENTRY"
          s_ids.each do |id|
            puts "Show ID #{id}"
          end
          print "Enter a show_id of the show record to UPDATE: "
          show_id = gets.chomp.to_i
        end
        venues = $db.execute("SELECT * FROM venue")
        v_ids = []
        venues.each do |venue|
          v_ids << venue['venue_id']
        end
        bands = $db.execute("SELECT * FROM band")
        b_ids = []
        bands.each do |band|
          b_ids << band['band_id']
        end
        puts "Enter an venue_id that exists in the database. Reference the following list:"
        v_ids.each do |id|
          puts "Venue ID #{id}"
        end
        print "Enter a venue ID: "
        venue_id = gets.chomp.to_i
        until v_ids.include?(venue_id)
          puts "INVALID ENTRY - Enter an venue_id that exists in the database. Reference the following list:"
          v_ids.each do |id|
            puts "Venue ID #{id}"
          end
          print "Enter a venue ID: "
          venue_id = gets.chomp.to_i
        end

        puts "Enter an band_id that exists in the database. Reference the following list:"
        b_ids.each do |id|
          puts "Band ID #{id}"
        end
        print "Enter a band ID: "
        band_id = gets.chomp.to_i
        until b_ids.include?(band_id)
          puts "INVALID ENTRY - Enter an band_id that exists in the database. Reference the following list:"
          b_ids.each do |id|
            puts "Band ID #{id}"
          end
          print "Enter a band ID: "
          band_id = gets.chomp.to_i
        end

        print "Enter the scheduled time: "
        scheduled_time = gets.chomp

        update_show(show_id, venue_id, band_id, scheduled_time)
        puts "New record added to show table"
      end
    end
  elsif table_action == "DELETE"
    if table_name == "owner"
      owners = $db.execute("SELECT * FROM owner")
      o_ids = []
      owners.each do |owner|
        o_ids << owner['owner_id']
      end
      if not o_ids.any?
        puts "\nNo owners exist in the database so nothing can be updated. If you would like to add an owner navigate to the INSERT function in the owner section."
        redo
      else
        o_ids.each do |id|
          puts "Owner ID #{id}"
        end
        print "Enter an owner_id of the owner record to UPDATE: "
        owner_id = gets.chomp.to_i

        until o_ids.include?(owner_id)
          puts "INVALID ENTRY"
          o_ids.each do |id|
          puts "Owner ID #{id}"
          end
          print "Enter an owner_id of the owner record to UPDATE: "
          owner_id = gets.chomp.to_i
        end

        delete_record("owner", owner_id)
        puts "Record deleted from owner table"

      end
    elsif table_name == "venue"
      venues = $db.execute("SELECT * FROM venue")
      v_ids = []
      venues.each do |venue|
        v_ids << venue['venue_id']
      end
      if not v_ids.any?
        puts "\nNo venues exist in the database so nothing can be updated. If you would like to add a venue navigate to the INSERT function in the venue section."
        redo
      else
        v_ids.each do |id|
          puts "Venue ID #{id}"
        end
        print "Enter an venue_id of the venue record to UPDATE: "
        venue_id = gets.chomp.to_i

        until v_ids.include?(venue_id)
          puts "INVALID ENTRY"
          v_ids.each do |id|
          puts "Venue ID #{id}"
          end
          print "Enter a venue_id of the venue record to UPDATE: "
          venue_id = gets.chomp.to_i
        end

        delete_record("venue", venue_id)
        puts "Record deleted from venue table"
      end

    elsif table_name == "band"
      bands = $db.execute("SELECT * FROM band")
      b_ids = []
      bands.each do |band|
        b_ids << band['band_id']
      end
      if not b_ids.any?
        puts "\nNo bands exist in the database so nothing can be updated. If you would like to add a band navigate to the INSERT function in the band section."
        redo
      else
        b_ids.each do |id|
          puts "Band ID #{id}"
        end
        print "Enter an band_id of the band record to UPDATE: "
        band_id = gets.chomp.to_i

        until b_ids.include?(band_id)
          puts "INVALID ENTRY"
          b_ids.each do |id|
          puts "Band ID #{id}"
          end
          print "Enter a band_id of the band record to UPDATE: "
          band_id = gets.chomp.to_i
        end

        delete_record("band", band_id)
        puts "Record deleted from band table"
      end
    elsif table_name == "show"
      shows = $db.execute("SELECT * FROM show")
      s_ids = []
      shows.each do |show|
        s_ids << show['show_id']
      end
      if not s_ids.any?
        puts "\nNo shows exist in the database so nothing can be updated. If you would like to add a show, navigate to the INSERT function in the show section."
        redo
      else
        s_ids.each do |id|
          puts "Show ID #{id}"
        end
        print "Enter an show_id of the show record to UPDATE: "
        show_id = gets.chomp.to_i

        until s_ids.include?(show_id)
          puts "INVALID ENTRY"
          s_ids.each do |id|
            puts "Show ID #{id}"
          end
          print "Enter a show_id of the show record to UPDATE: "
          show_id = gets.chomp.to_i
        end

        delete_record("show", show_id)
        puts "Record deleted from show table"
      end
    end
  end
end

