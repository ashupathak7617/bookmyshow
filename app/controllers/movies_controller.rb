class MoviesController < ApplicationController
  before_action :movie, only: :show
  
  def index
    @movies = Movie.all
    return unless params[:search].present?
    
    @movies = @movies.where("name ILIKE ?", "%#{params[:search]}%")
  end

  def show
<<<<<<< HEAD
    
    @movie = Movie.find(params[:id])
    @theaters = @movie.theaters
=======
    @theater = @movie.theaters
>>>>>>> e4684c97771acb75df8240fd266a4ba0f54e23c9
    @shows = @movie.shows
    # @screen = @theater.screens
    # @show = @screen.shows
  end
end
