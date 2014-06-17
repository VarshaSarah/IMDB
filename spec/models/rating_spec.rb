require 'spec_helper'

describe Rating do
  #pending "add some examples to (or delete) #{__FILE__}"
	let(:rating){FactoryGirl.create(:rating)}	#inserted into database

	it"Tests range " do
		expect((0..5)).to include(rating.stars)
	end

	it"does not allow same user to rate a Movie/Song Twice" do
		rdup = Rating.new(rating.attributes)
		expect(rdup.valid?).to eq(true)
	end
end
