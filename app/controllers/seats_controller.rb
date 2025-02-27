class SeatsController < ApplicationController
  def index
    @seats = Seat.where(screen_id: params[:screen_id])
  end
end
