namespace :holarse do
  namespace :demo do

    desc "adds demo users"
    task :users => :environment do
      for i in 0..10
        u = FactoryGirl.create(:user)  
        puts "Created #{u.username}"
      end
    end

    desc "adds demo news"
    task :news => :environment do
      for i in 0..10
        u = FactoryGirl.create(:news)
      end
    end

    desc "adds demo articles"
    task :articles => :environment do
      puts "adding demo articles"
    end

    desc "adds demo comments"
    task :comments => :environment do
      puts "adding demo comments"
    end

    desc "adds demo data"
    task :install => [:users, :news, :articles, :comments]
  end
end
