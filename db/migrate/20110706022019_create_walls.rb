class CreateWalls < ActiveRecord::Migration
  def self.up
    create_table :walls do |t|
      t.string :name
      t.integer :height
      t.integer :gym_id

      t.timestamps
    end
  end

  def self.down
    drop_table :walls
  end
end
