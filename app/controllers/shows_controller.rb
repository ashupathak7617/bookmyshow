class ShowsController < ApplicationController
  before_action :movie

  def index
    @theaters = @movie.theaters.distinct
    render json: {
      movie: @movie,
      theaters: @theaters.as_json(include: { shows: { only: [ :id, :show_time, :screen_id ] } })
    }
  end

  def seats
    show = Show.find(params[:id])
    booked_seat_ids = Booking.where(show: show)
                           .flat_map(&:seat_ids)

    render json: {
      show: show,
      seats: show.screen.seats,
      booked_seat_ids: booked_seat_ids
    }
  end
end
