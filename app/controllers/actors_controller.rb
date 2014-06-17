class ActorsController < ApplicationController
	def index
		@actors = Actor.all
	end

	def show
		#fetch actor object using the id
		@actor = Actor.find(params[:id])
		
		#fetch all the movies
		@movies = @actor.movies
		@movie_actors = @actor.movie_actors

	end

	def new 
		@actor = Actor.new

	end

	def create
 		@actor = Actor.new(actors_params) #chexk...
		if @actor.save
			redirect_to actors_path
		else
			render action: 'new'
		end
	end
		
  def update
    @actor = Actor.find(params[:id])
#		@actor.name = Actor.new(actors_params).name

    if @actor.update_attributes(actors_params)
      redirect_to actors_path
    else
      render action: 'new'
    end
  end


	def actors_params		
		puts params.require(:actor).permit(:name)   #the inspect element editing...sends multiple parameters...but only permitted values are inserted
		params.require(:actor).permit(:name)
	end
	
	def edit
	 @actor = Actor.find(params[:id])
		
	end

	def	destroy 
		@actor = Actor.find(params[:id])
		if @actor.destroy
			redirect_to actors_path
		else
			render action: 'new'
		end
	end

end
