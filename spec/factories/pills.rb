# spec/factories/pills.rb
FactoryGirl.define do
  schedule = IceCube::Schedule.new
  factory :pill do
    name { Faker::Name.name }
    reminders { schedule.add_recurrence_rule IceCube::Rule.weekly.day(1, 3, 5).hour_of_day(9)}
    remind_trackers { Chronic.parse("2 hours") }
    user_id { Faker::Number.number(10) }
  end
end
