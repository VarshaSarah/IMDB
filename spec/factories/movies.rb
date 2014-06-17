FactoryGirl.define do
  factory :movie do |m|
    m.name Faker::Name.first_name + " " + Faker::Name.first_name
    m.description Faker::Name.title
  end

end