class ChangeImageToJson < ActiveRecord::Migration[5.1]
  def change
  	change_column :photo_images, :image, 'json USING image::json'
  end
end
