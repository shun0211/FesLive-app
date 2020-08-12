class CreateImageLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :image_likes do |t|
      t.references :user, foreign_key: true
      t.references :image, foreign_key: true
      t.timestamps
    end
  end
end
