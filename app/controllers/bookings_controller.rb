class BookingsController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @booking = Booking.new
    @movie = Movie.find_by(id: params[:movie_id])
    @theater = Theater.find_by(id: params[:theater_id])
    @show = Show.find_by(id: params[:show_id])
  end

  def create

    @booking = Booking.new(params_permit)
    if @booking.seat_ids.present?
      if @booking.save
        
        @booking.seats.update_all(status: "false")
        redirect_to booking_path(id: @booking.id) ,notice: "Your Ticket Booked successfully "
      else
       render :new
      end

    else
      redirect_to movies_path, alert: "Please select atleast one seat"
    end
  end

  def show
    @booking  = Booking.find(params[:id])
  end
  
  private

  def params_permit
    params.require(:booking).permit(:show_id, :customer_id, :screen_id, :movie_id, :theater_id, seat_ids: [])
     # params.expect(booking: [ :show_id, :customer_id, :screen_id, :movie_id, :seat_ids ])
  end
end
