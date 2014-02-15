#encoding: utf-8
namespace :holarse do
  namespace :import do


    desc "clear db"
    task :clear => :environment do
      data = [Comment, Article, News, NewsUpdate, DiscountEvent, Revision, Inbox, Comment, User, Role]

      progress = ProgressBar.create(title: "Datenbank löschen", starting_at: 0, total: data.size)
      data.each do |item|
	item.delete_all
	progress.increment
      end
    end

    desc "user import"
    task :users => :environment do
      require "lib/tasks/importmodels"
      require "lib/tasks/converters"

      puts "Importiere die Benutzer..."
      User.delete_all
      Role.delete_all

      u = ImportUser.all
      progress = ProgressBar.create(title: "Benutzer-Import", starting_at: 0, total: u.size)
      ImportUser.all.each do |user|
	user.convert.save!(validations: false)
	progress.increment
      end
    end
  
  end
end
