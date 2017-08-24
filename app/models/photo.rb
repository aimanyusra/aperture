class Photo < ApplicationRecord
	belongs_to :user
	has_many :photo_images, dependent: :destroy
	has_many :taggings
	has_many :tags, through: :taggings

	validates :photo_images, :presence => true

	validate :photo_size_validation

	private

	def photo_size_validation
    	errors[:photo_images] << "should be more than 2MB" if photo_images.size < 2.megabytes
  	end
end
