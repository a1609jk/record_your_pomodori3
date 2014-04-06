# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "succi0303"
    email "succi0303@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
