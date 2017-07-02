class CreatePhotoImages < ActiveRecord::Migration[5.1]
  def change
    create_table :photo_images do |t|
    	t.integer :photo_id
      t.string :image
      t.timestamps
    end
  end
end
