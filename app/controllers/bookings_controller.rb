class BookingsController < ApplicationController
  
  before_action :authenticate_customer!
  before_action :find_by_params, only: [:new, :create]
               
  def index
    @bookings = Booking.where(customer_id: current_customer.id)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(params_permit)
    if @booking.save
      redirect_to booking_path(id: @booking.id) ,notice: "Your Ticket Booked successfully "
    else
      flash[:notice] = @booking.errors.full_messages.first 
      redirect_to new_booking_path(booking: {show_id: @show.id})
    end
  end

  def show
    @booking  = Booking.find(params[:id])
    @show = @booking.show
  end
  
  private

  def find_by_params
    
    @show = Show.find_by(id: params[:booking][:show_id])
    @movie = @show.movie
    @screen  = @show.screen
    @seats = @screen.seats
  end

  def params_permit
  params.require(:booking).permit(:show_id, :customer_id, :screen_id, seat_ids: [])
  end
end
