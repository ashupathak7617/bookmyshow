class SeatsController < ApplicationController
  def index
    @theater = Theater.find(params[:id])
  end
end
