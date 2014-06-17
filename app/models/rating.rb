class Rating < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :ratable, polymorphic: true #kvpair
	validates_numericality_of :stars
	validates :stars, inclusion: {in: 0..5}
	#validates :user_id, presence: true
	validates :ratable_id, presence: true
	validates :ratable_type, presence: true
	validate :checkdupl
	#validates_associated :user_id

	def checkdupl
		if Rating.where(user_id: self.user_id, ratable_id: self.ratable_id, ratable_type: self.ratable_type).count > 0
			errors.add(:user_id, "User Cannot rate a movie/song twice")
		end

		#self.each do |entry|
			#if(entry.user_id == self.user_id)
			
			#end
		#end		

	end

end
