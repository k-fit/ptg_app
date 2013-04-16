namespace :db do
  desc "Fill database with users"
  task populate: :environment do
    admin = User.create!(name: "Matt DeLand",
                 email: "matt@kfitsolutions.com",
                 password: "mattkfit",
                 password_confirmation: "mattkfit")
    admin.toggle!(:admin)
    
    daniel = User.create!(name: "Daniel Krasner",
                 email: "daniel@kfitsolutions.com",
                 password: "danielkfit",
                 password_confirmation: "danielkfit")

    admin.localtrades.create!(buy: true, broker: "SCP", trader: "test", volume: 1, contract_type: "CU", commission: true, price: 10, settlement: "Apr-13", trade_date: Date.today)
    admin.localtrades.create!(buy: true, broker: "SCP", trader: "test", volume: 2, contract_type: "CU", commission: true, price: 10, settlement: "Apr-13", trade_date: Date.today)
    admin.localtrades.create!(buy: true, broker: "SCP", trader: "test", volume: 3, contract_type: "CU", commission: true, price: 10, settlement: "Apr-13", trade_date: Date.today)
    
    daniel.localtrades.create!(buy: true, broker: "SCP", trader: "test", volume: 1, contract_type: "CU", commission: true, price: 10, settlement: "Apr-13", trade_date: Date.today)
    daniel.localtrades.create!(buy: true, broker: "SCP", trader: "test", volume: 1, contract_type: "CU", commission: true, price: 10, settlement: "Apr-13", trade_date: Date.today)
    daniel.localtrades.create!(buy: true, broker: "SCP", trader: "test", volume: 1, contract_type: "CU", commission: true, price: 10, settlement: "Apr-13", trade_date: Date.today)
    
  end
end