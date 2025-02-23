class ShowsController < ApplicationController
  def index
     @movie = Movie.find(params[:movie])
  end

  def show
  end
end
