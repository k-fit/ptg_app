namespace :db do
  desc "Fill database with users"
  task populate: :environment do
    admin = User.create!(name: "Matt DeLand",
                 email: "matt@kfitsolutions.com",
                 password: "mattkfit",
                 password_confirmation: "mattkfit")
    admin.toggle!(:admin)
    
    User.create!(name: "Daniel Krasner",
                 email: "daniel@kfitsolutions.com",
                 password: "danielkfit",
                 password_confirmation: "danielkfit")
    
  end
end