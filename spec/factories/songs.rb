FactoryGirl.define do
	factory :song do |s|
		s.name	{Faker::Name.first_name	}
		s.composer	{Faker::Name.first_name	}
	end
end
