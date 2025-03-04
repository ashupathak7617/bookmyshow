class Seat < ApplicationRecord
  belongs_to :screen
  has_many :tickets
  has_and_belongs_to_many :bookings
  # validates :seat_no, uniqueness: true
  def self.ransackable_associations(auth_object = nil)
    ["screen"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "screen_id", "seat_no", "seat_create_eq","updated_at","tickets_id_eq","status_cont","status_eq","status_start","status_end","seat_create_gt", "seat_create_lt", "bookings_id_eq"]
  end  
  
  

  def self.create_seats(screen_id, seat_create)
    seat_name = Seat.where(screen_id: screen_id).pluck(:seat_no).last
    seat_start_from = seat_name&.gsub(/\D/, '').to_i + 1
    seat_create.times do |index|
      create(screen_id: screen_id, seat_no:"#{ seat_start_from + index }")
    end
  end
end
