class CreateSetLists < ActiveRecord::Migration[5.0]
  def change
    create_table :set_lists do |t|
      t.references :event
      t.string :artist, null: false
      t.string :first_song, null: false
      t.string :second_song
      t.string :third_song
      t.string :fourth_song
      t.string :fifth_song
      t.string :sixth_song
      t.string :seventh_song
      t.string :eighth_song
      t.string :ninth_song
      t.string :tenth_song
      t.timestamps
    end
  end
end
