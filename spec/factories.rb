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
end