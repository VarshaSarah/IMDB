class UsersController < ApplicationController

  def index
    @users = User.all
    @user = User.new

  end

  def new
    @user = User.new
  end

  def create

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @movie.update_attributes(movie_params)
      redirect_to movies_path
    else
      render action: 'new'
    end

  end

  def show
    user1 = User.where(name:params[:name])

    @movies = Movie.all
    @songs = Song.all
  end

end