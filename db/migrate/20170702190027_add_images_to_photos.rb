class AddImagesToPhotos < ActiveRecord::Migration[5.1]
  def change
  	add_column :photos, :images, :string, array: true, default: [] # add images column as array

  end
end
