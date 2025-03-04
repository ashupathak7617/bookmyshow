module BookingsHelper
	def booking_details
    seats.map do |seat|
      # "#{seat.seat_no} (#{ Screen.find(seat.id).screen_name})"

      "#{seat.seat_no} (#{ seat.screen.screen_name})"
    end.join(',')
  end
end
    