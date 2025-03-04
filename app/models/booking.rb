class Booking < ApplicationRecord
  include BookingsHelper
  belongs_to :movie
  belongs_to :theater
  belongs_to :customer
  belongs_to :show
  has_and_belongs_to_many :seats

  after_save :update_seat

  def update_seat
    self.seats.update_all(status: false)
  end
end
