class Photo < ApplicationRecord
	belongs_to :user
	has_many :photo_images, dependent: :destroy

end
