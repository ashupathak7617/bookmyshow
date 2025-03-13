class ShowsController < ApplicationController
  before_action :movie
  
  def index
    @theaters = @movie.theaters.distinct
  end
end
