require 'spec_helper'

describe User do
#  pending "add some examples to (or delete) #{__FILE__}"
#do 
#	subject(:user){User.new(arguments)}
	
	#before(:each) do
	#	@user = User.create(:name => 'abc')
	#end

	#let(:user){User.create(:name => 'abc')}
	#let{|User| User.create(:username =>'abc')}
	
	let(:user){FactoryGirl.create(:user)}

	it"Validates username" do
		#expect(subject.name).to eq("")
		expect(user.name).to match(/[a-zA-Z0-9]/)
	end
	
	it"Username existence" do
		expect(user.name).to be_true
	end

#describe".method"
end
