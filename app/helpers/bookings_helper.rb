module BookingsHelper
	def booking_details
    seats.map do |seat|
      "#{ seat.seat_no }"
    end.join(',')
  end
end
    