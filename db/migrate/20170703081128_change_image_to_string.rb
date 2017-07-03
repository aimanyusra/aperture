class ChangeImageToString < ActiveRecord::Migration[5.1]
  def change
  	change_column :photo_images, :image, :string
  end
end
