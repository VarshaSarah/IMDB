FactoryGirl.define do 
	factory :user do |u|
		u.name	{Faker::Name.first_name}	#module class method  u.name(specified by user whtver he has assumnd earlier)
	end

end
