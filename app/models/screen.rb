class Screen < ApplicationRecord

	# validates :screen_name, uniqueness: true
	validates_uniqueness_of   :screen_name, scope: :theater_id

	belongs_to :theater
	has_many :shows
	has_many :seats

	def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "screen_name", "theater_id", "updated_at", "srceen_name_cont", "srceen_name_eq", "srceen_name_start", "srceen_name_end"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["seats", "shows", "theater"]
  end

  def to_s
    screen_name 
  end
end
