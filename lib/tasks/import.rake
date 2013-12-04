namespace :holarse do
  namespace :import do

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
