class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :event_day
      t.string :performing_artist
      t.string :event_image
      t.string :event_place
      t.timestamps
    end
  end
end
