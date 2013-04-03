FactoryGirl.define do
  factory :user do
    name     "Matt DeLand"
    email    "matt@kfitsolutions.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
