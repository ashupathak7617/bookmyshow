class Booking < ApplicationRecord
  include BookingsHelper
  # belongs_to :movie
  # belongs_to :theater
  belongs_to :customer
  belongs_to :show
  has_and_belongs_to_many :seats

  after_save :update_seat
  # validate :seat_must_be_avaible

  validates_presence_of :seats, message: "Your Booking Has Been Cancelled ! Please select atleast one seat...!"

  def update_seat
    self.seats.update_all(status: false)
  end

  def seat_must_be_avaible
    booked_seats_ids = Booking.where(show: show).flat_map(&:seat_ids)
    conflict = seat_ids & booked_seats_ids
    if conflict.any?
      errors.add(:seats, "Selected Seats already booked: #{conflict.join(', ')}")
    end
  end
end
