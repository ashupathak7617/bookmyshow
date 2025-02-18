class Theater < ApplicationRecord
	
	has_many :screens
	has_many :shows
  has_many :movies, through: :shows
	# validates_associated :screens

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "location", "movies_id", "name", "updated_at"]
  end

	def self.ransackable_associations(auth_object = nil)
    ["movies", "screens", "shows"]
  end
end
