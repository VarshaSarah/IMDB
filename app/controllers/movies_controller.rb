class MoviesController < ApplicationController

  def index
    @movies = Movie.all
    @movie = Movie.new
    @actor = Actor.all
  end

  def new
    @movie = Movie.new

  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path
    else
      render action: 'new'
    end

  end

  def show
    @movie = Movie.find(params[:id])
    @songs = @movie.songs
    @actors = @movie.actors

  end

  def edit
    @movie = Movie.find(params[:id])
  end


  def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(movie_params)
      redirect_to movies_path
    else
      render action: 'edit'
    end

  end


  def destroy
    @movie = Movie.find(params[:id])
    if @movie.destroy
      redirect_to movies_path
    else
      render action: 'new'
    end
  end

  def movie_params
    params.require(:movie).permit(:name,songs_attributes: [:id, :name,:_destroy],movie_actors_attributes: [:id,:actor_id, :_destroy],ratings_attributes:[:stars])
  end

end
