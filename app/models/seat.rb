class Seat < ApplicationRecord
  belongs_to :screen
  has_many :tickets

  def self.ransackable_associations(auth_object = nil)
    ["screen"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "screen_id", "seat_no", "updated_at","tickets_id_eq","status_cont","status_eq","status_start","status_end"]
  end
end
