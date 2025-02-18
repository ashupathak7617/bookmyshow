class Seat < ApplicationRecord
  belongs_to :screen

  def self.ransackable_associations(auth_object = nil)
    ["screen"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "screen_id", "seat_no", "updated_at"]
  end
end
