namespace :holarse do
  namespace :import do

    require 'jdbc/mysql'
    require 'java'
    Jdbc::MySQL.load_driver

    @conn = java.sql.DriverManager.get_connection("jdbc:mysql://localhost/holarse", "dbimport", "dbimport")

    desc "dummy import"
    task :default => :environment do
      puts "nothing to do here yet..."
    end

    desc "user import"
    task :users => :environment do
      puts "Importiere die Benutzer..."
    end
  
  end
end
