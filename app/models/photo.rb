class Photo < ApplicationRecord
	belongs_to :user
	has_many :photo_images, dependent: :destroy
	has_many :taggings
	has_many :tags, through: :taggings
end
