require 'spec_helper'

describe Movie do
  #pending "add some examples to (or delete) #{__FILE__}"
	it "checks duplicacy" do
		m1 = Movie.create(name:"coffee", description: "asdf")
		m2 = Movie.new(name:"coffee")
		expect(m2.valid?).to eq(true)
	end
	
	
end
