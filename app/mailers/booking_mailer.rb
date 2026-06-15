class BookingMailer < ApplicationMailer
  def confirmation_email(booking)
    @booking  = booking
    @customer = booking.customer
    @show     = booking.show
    @movie    = @show.movie
    @seats    = booking.seats
    @total    = @seats.sum(:price)

    mail(
      to:      @customer.email,
      subject: "Booking Confirmed! #{@movie.name} - BookMyShow"
    )
  end
end
