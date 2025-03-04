class Show < ApplicationRecord
  belongs_to :movie
  belongs_to :theater
  belongs_to :screen
  has_many :tickets

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "movie_id", "screen_id", "show_time", "theater_id", "updated_at", "tickets_id_eq"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["movie", "screen", "theater"]
  end

  def to_s
    show_time 
  end
end
