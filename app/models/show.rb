class Show < ApplicationRecord
  belongs_to :movie
  belongs_to :theater
  belongs_to :screen
  has_many :bookings

  validates :show_time , uniqueness: {scope: :screen_id}

  validate :check_show_time
  
  def check_show_time
    
    other_show = Show.where(screen_id: screen_id).where.not(id: id).where("show_time < ? AND end_time > ?", end_time, show_time).exists?

    if other_show
      errors.add(:base, "this screen is already in used for this time")
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "movie_id", "bookings_id_eq", "screen_id", "show_time", "theater_id", "updated_at","tickets_id_eq"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["movie", "screen", "theater"]
  end

  def to_s
    show_time 
  end
end
