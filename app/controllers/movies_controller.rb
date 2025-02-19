class MoviesController < ApplicationController
  
  def index
    if params[:movie].present?
      @movies = Movie.where("name like ?", "%#{params[:movie]}%")
    else
      @movies = Movie.all
    end
  end

  def show
    
    @movie = Movie.find(params[:id])
    @theater = @movie.theaters
    @shows = @movie.shows
    # @screen = @theater.screens
    # @show = @screen.shows
  end
end
