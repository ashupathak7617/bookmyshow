class Theater < ApplicationRecord
	
	has_many :screens
	has_many :shows
  has_many :movies, through: :shows
  has_many :tickets

  validates :name, :location, presence: true
  validates :name, :location, presence: true, on: :update

	# validates_associated :screens

  def self.ransackable_attributes(auth_object = nil)
<<<<<<< HEAD
    ["created_at", "id", "location", "movies_id", "name", "updated_at", "tickets_id_eq"]
=======
    ["created_at", "id", "location", "movies_id", "name", "updated_at","tickets_id_eq"]
>>>>>>> e4684c97771acb75df8240fd266a4ba0f54e23c9
  end

	def self.ransackable_associations(auth_object = nil)
    ["movies", "screens", "shows"]
  end

  def to_s
    name
  end
end
