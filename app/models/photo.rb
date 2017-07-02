class Photo < ApplicationRecord
	belongs_to :user
	has_many :photo_images

	validates :images, :presence => true
end
