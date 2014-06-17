class Movie < ActiveRecord::Base
	
	has_many :songs, dependent: :destroy 
	has_many :movie_actors, dependent: :destroy
	has_many :actors, through: :movie_actors	
	has_many :ratings, as: :ratable	,dependent: :destroy

	#validates :description, presence: true

  accepts_nested_attributes_for :songs, :movie_actors, :ratings ,:allow_destroy => true

#	validate :check_name 

	#validates :name, uniqueness: true
	
	#validates_numericality_of :rating

	#before_validation :check_ratings

	before_save :capitalize

	after_create :creation
	
	after_save :saving

	after_update :updation

#def check_name
	#errors.add(:name, 'Change Name') if name != 'Varsha'
#end	


	def check_ratings
		self.rating = 5 if rating == nil
	end


	def creation
		#puts "Entry for #{name} Created "
	end

	def updation
		#puts "Entry for #{name} Updated "
	end

	def saving
		#puts "Entry for #{name} saved"
	end

	def capitalize
#		puts"in caps"
		if	/[A-Z]/.match(self.name[0])!= nil
			self.name = name.upcase

		else
			self.name = name.titleize

		end
	end
end
