class Theater < ApplicationRecord
	
	has_many :screens
	has_many :shows
  has_many :movies, through: :shows
  
  validates :name, :location, presence: true
  validates :name, :location, presence: true, on: :update

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "location", "movies_id", "name", "updated_at","tickets_id_eq"]
  end

	def self.ransackable_associations(auth_object = nil)
    ["movies", "screens", "shows"]
  end

  def to_s
    name
  end
end
