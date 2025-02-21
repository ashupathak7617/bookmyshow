class BookingsController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @booking = Booking.new
    @movie = Movie.find_by(id: params[:movie_id])
    @theater = Theater.find_by(id: params[:theater_id])
    @screen = @theater.screens
    @show = Show.find_by(id: params[:show_id])

     
    end

  def create
     
    # @movie = Movie.find(params_permit[:movie_id])
    # @theater = Theater.find(params_permit[:theater_id])
    # @screen = @theater.screens
    # @show = Show.find(params_permit[:show_id])
     # @seats = @booking.seats.where(params[:booking][:seat_ids])
     byebug
    @booking = Booking.new(params_permit)
    
    if @booking.save
        byebug
        @booking.seats.update_all(status: "false")
      redirect_to movies_path ,notice: "Your Ticket Booked successfully "
    else
       render :new
    end

  end
  
  private

  def params_permit
    params.require(:booking).permit(:show_id, :customer_id, :screen_id, :movie_id, :theater_id, seat_ids: [])
     # params.expect(booking: [ :show_id, :customer_id, :screen_id, :movie_id, :seat_ids ])
  end
end
