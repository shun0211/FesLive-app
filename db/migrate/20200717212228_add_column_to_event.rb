class AddColumnToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :event_first_day, :date, null: false
  end
end
