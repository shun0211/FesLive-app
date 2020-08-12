class CreateCommentToImages < ActiveRecord::Migration[5.0]
  def change
    create_table :comment_to_images do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :image, foreign_key: true
      t.timestamps
    end
  end
end
