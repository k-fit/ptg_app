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

  desc "Populate database with clearport trades"
  task populate: :environment do
    Clearport.create!(trade_id: "123", report_id: "123", execution_id: "123",
    trade_match_id: "456", trade_date: "12-12-2012", trade_type: 1, instrument_id: "CU", 
    sec_type: "678", future_month: "Apr-13",
    report_side: 0, price: 1.0, quantity: 2.0, quantity_type: "1", CME_broker: "CME_broker", 
    broker: "test", trader: "Joe")
  end
end