class ShowsController < ApplicationController
  
  def index
    @movie = Movie.find(params[:movie])
    @theaters = @movie.theaters.distinct
  end

  def show
  end
end
