# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :daily_report do
    association :monthly_report
    day 1
    pomodori 12
    task 10
    memo "デイリーレポートのメモ"
  end
end
