class TicketsController < ApplicationController
 
  def index
    @movie = Movie.find(params[:movie])
    
    @theaters = @movie.theaters
  end
end
