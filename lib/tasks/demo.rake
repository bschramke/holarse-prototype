namespace :holarse do
  namespace :demo do

    desc "adds demo users"
    task :users => :environment do
      u1 = User.new(:username => "user1", :password => "user1", :email => "user1@aol.com")
      u1.save!
    end

    desc "adds demo news"
    task :news => :environment do
      n1 = News.new(:title => "Eine neue News", :subtitle => "News sind wichtig!", :content => "Laber rhababer auf [[PokerTH]].")
      n1.author = User.find "user1"
      n1.links << Link.new(:url => "http://www.duckduckgo.com", :description => "Suchmaschinen-Link")
      n1.save!
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
