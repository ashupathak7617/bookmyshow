class Booking < ApplicationRecord
  include BookingsHelper
  belongs_to :movie
  belongs_to :theater
  belongs_to :customer
  belongs_to :show
  has_and_belongs_to_many :seats
end
