FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :localtrade do
    buy true
    contract_type "CU"
    settlement "Apr-13"
    volume 10.0
    price 2.5
    broker "IVG"
    commission true
    trader "Matt"
    trade_date Date.today
    user
  end

  factory :clearport do
    trade_id "123456"
    report_id "234567"
    execution_id "345678"
    trade_match_id "456789"
    trade_date "04-20-2012"
    trade_type 1
    instrument_id "1"
    sec_type "abc"
    future_month "Apr-14"
    report_side 0
    price 2.45
    quantity 10.0
    quantity_type "1"
    CME_broker "advantage_trades"
    broker "advantage"
    trader "Joe"
  end
end