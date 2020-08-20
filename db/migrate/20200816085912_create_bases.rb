class CreateBases < ActiveRecord::Migration[5.0]
  def change
    create_table :bases do |t|

      t.timestamps
    end
  end
end
