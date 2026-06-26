class BookingsController < ApplicationController
  before_action :authenticate_customer!, only: %w[ create show]
  skip_before_action :verify_authenticity_token

  def index
    bookings = Booking.where(customer_id: current_customer.id)
    render json: bookings, include: {show: {include: :movie}, seats: {}}
  end

  def create
    @show   = Show.find_by(id: params[:booking][:show_id])
    @movie  = @show.movie
    @booking = Booking.new(params_permit.merge(customer_id: current_customer.id))

    if @booking.save
      session = Stripe::Checkout::Session.create({
        mode: 'payment',
        line_items: [{
          quantity: 1,
          price_data: {
            currency: 'inr',
            unit_amount: @booking.seats.sum(:price) * 100,
            product_data: {
              name: @movie.name,
              description: "Seats: #{@booking.seats.map(&:seat_no).join(', ')}"
            }
          }
        }],
        metadata: { booking_id: @booking.id },
        success_url: "#{ENV["BASE_URL"]}/payment/success?booking_id=#{@booking.id}",
        cancel_url:  "#{ENV["BASE_URL"]}/payment/cancel?booking_id=#{@booking.id}"
      })
      @booking.update!(stripe_session_id: session.id, status: 'pending')

      render json: { stripe_url: session.url }
    else
      render json: { error: @booking.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def show
    booking = Booking.find(params[:id])
    render json: booking, include: [:show, :seats]
  end

  def success
    booking = Booking.find(params[:booking_id])
    render json: { booking: booking, show: booking.show, movie: booking.show.movie }
  end

  def cancel
    booking = Booking.find(params[:booking_id])
    render json: { booking: booking, show: booking.show, movie: booking.show.movie }
  end

  private

  def params_permit
    params.require(:booking).permit(:show_id, :customer_id, :screen_id, seat_ids: [])
  end
end