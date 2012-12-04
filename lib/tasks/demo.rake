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
        u = FactoryGirl.create(:user)
        puts "Created #{u.username}"
      end

      1.times do
        u = FactoryGirl.create(:admin)
        puts "Created admin #{u.username}"
      end
    end

    desc "adds demo news"
    task :news => :environment do
      users = User.all

      10.times do
        u = FactoryGirl.build(:news)
        u.author = users[rand(users.length)]

        1..rand(3) do
          u.links << FactoryGirl.create(:link)
        end

        1..rand(10) do
          u.comments << FactoryGirl.create(:comment, :author => users[rand(users.length)])
        end

        u.save!
        puts "Created news #{u.title} from #{u.author.username} with #{u.comments.length} comments"
      end
    end

    desc "adds demo articles"
    task :articles => :environment do
      puts "adding demo articles"
    end

    desc "adds demo data"
    task :install => [:users, :news, :articles]
  end
end
