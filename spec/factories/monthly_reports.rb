FactoryGirl.define do
  factory :monthly_report do
    association :user
    year 2014
    month 4
    memo "This is test monthly report."
  end
end
