class TicketsController < ApplicationController
 
  def index
    @movie = Movie.find(params[:movie])
    # @theater = Movie.find(params[:theater])
  end
end
