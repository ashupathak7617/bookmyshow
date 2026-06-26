class Seat < ApplicationRecord
  belongs_to :screen
  has_and_belongs_to_many :bookings
  validates :seat_no, presence: true
  validates :screen, presence: true

  def self.ransackable_associations(auth_object = nil)
    [ "screen" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "id", "screen_id", "seat_no", "seat_create_eq", "updated_at", "tickets_id_eq", "status_cont", "status_eq", "status_start", "status_end", "seat_create_gt", "seat_create_lt", "bookings_id_eq", "price_eq", "price_gt", "price_lt" ]
  end

  def self.create_seats(screen_id, seat_create)
    seat_name = Seat.where(screen_id: screen_id).pluck(:seat_no).last
    seat_start_from = seat_name&.gsub(/\D/, "").to_i + 1
    seat_create.times do |index|
      price =
      case index
      when 0..32
        200
      when 33.. 128
        150
      else
        100
      end
      create(screen_id: screen_id, seat_no: "#{ seat_start_from + index }", price: price)
    end
  end
end
