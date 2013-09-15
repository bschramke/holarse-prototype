namespace :holarse do
  namespace :demo do

    desc "cleans the database"
    task :clean => :environment do
      News.delete_all
      Article.delete_all
      User.delete_all
    end

    desc "adds demo users"
    task :users => :environment do
      10.times do
	u = Fabricate(:user)
	puts "Created #{u.username}"
      end
    end

    desc "adds demo news"
    task :news => :environment do
      users = User.all

      10.times do
        u = FactoryGirl.build(:news)
        u.user = users[rand(users.length)]

        3.times do
          u.links << FactoryGirl.create(:link)
        end

        3.times do
          u.comments << FactoryGirl.create(:comment, :user => users[rand(users.length)])
        end

        u.save!
        puts "Created news #{u.title} from #{u.user.username} with #{u.comments.length} comments"
      end
    end

    desc "adds demo articles"
    task :articles => :environment do
      puts "adding demo articles"
      users = User.all
      10.times do
        u = FactoryGirl.build(:article)
        u.user = users[rand(users.length)]
        u.save!

        puts "Created news #{u.title} from #{u.user.username} with #{u.comments.length} comments"
      end
    end

    desc "adds demo data"
    task :install => [:users, :news, :articles]
  end
end
