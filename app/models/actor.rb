class Actor < ActiveRecord::Base
	
	has_many :movie_actors , dependent: :destroy
	has_many :movies , :through => :movie_actors
	validates :name , uniqueness: true
	validates :name , presence: true


	#validates :name , format: { with: /\A[A-Z][a-z]+(\s[A-Z][a-z])*\z/ }

	

end
