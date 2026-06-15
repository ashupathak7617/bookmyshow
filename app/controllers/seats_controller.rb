class SeatsController < ApplicationController
  def index
    @seats = Seat.where(screen_id: params[:screen_id])
    render json: @seats
  end

  def seats
    show = Show.find(params[:id])

    render json: {
      show: show,
      seats: show.screen.seats
    }
  end
end