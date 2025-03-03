class MoviesController < ApplicationController
  before_action :movie, only: :show
  
  def index
    @movies = Movie.all
    return unless params[:search].present?
    
    @movies = @movies.where("name ILIKE ?", "%#{params[:search]}%")
  end

  def show
    @theater = @movie.theaters
    @shows = @movie.shows
    # @screen = @theater.screens
    # @show = @screen.shows
  end
end
