class PhotoImage < ApplicationRecord
	mount_uploader :image, PictureUploader
	belongs_to :photo
end

