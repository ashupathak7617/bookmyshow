class Ticket < ApplicationRecord
  belongs_to :show
  belongs_to :customer
  belongs_to :screen
  belongs_to :movie
  belongs_to :theater
end
