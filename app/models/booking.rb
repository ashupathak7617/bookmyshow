class Booking < ApplicationRecord
  include BookingsHelper
  # belongs_to :movie
  # belongs_to :theater
  belongs_to :customer
  belongs_to :show
  has_and_belongs_to_many :seats

  after_save :update_seat
  
  validates_presence_of :seats, message: "Your Booking Has Been Cancelled ! Please select atleast one seat...!"

  def update_seat
    self.seats.update_all(status: false)
  end
end
