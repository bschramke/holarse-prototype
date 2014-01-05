namespace :holarse do
  namespace :import do

    class ImportModel < ActiveRecord::Base
        self.abstract_class = true
	establish_connection(
          adapter: "mysql",
          database: "holarse",
          username: "root",
          password: "iwiw1h",
          host: "localhost"
	)
    end

    class ImportUser < ImportModel
      self.table_name = "users"
      self.primary_key = "uid"

      belongs_to :import_user_signature, foreign_key: "uid"

      default_scope { where("name is not null or name <> '' and mail is not null and mail <> '' and pass is not null and pass <> ''").where("uid > 0") }

      def convert
	User.new(
	  username: self.name,
	  email: self.mail,
	  old_password_hash: self.pass,
	  created_at: Time.at(self.created).to_datetime,
	  signature: self.import_user_signature.present? ? self.import_user_signature.signature : nil,
	  active: status
	)
      end

      class ImportUserSignature < ImportModel
	self.table_name = "users_signature"
	self.primary_key = "uid"
      end
    end

    desc "dummy import"
    task :default => :environment do
      puts "nothing to do here yet..."
    end

    desc "user import"
    task :users => :environment do
      puts "Importiere die Benutzer..."
      User.delete_all
      ImportUser.all.each do |user|
	if not user.convert.save!(validations: false)
	  print "konnte benutzer #{user.name} nicht speichern"
	end
      end
    end
  
  end
end
