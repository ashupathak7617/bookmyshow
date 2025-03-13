class Movie < ApplicationRecord
	has_many :shows
	has_many :theaters, through: :shows
  has_one_attached :image
  
  validates :name, :image, :release_date, presence: true
  
  
  scope :find_by_name, ->(name) { where(name: name) if name }

	def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "release_date", "file", "theaters_id", "updated_at", "image_blob_id_eq", "image_attachment_id_eq"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["shows", "theaters"]
  end
end
