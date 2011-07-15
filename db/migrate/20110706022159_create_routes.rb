class CreateRoutes < ActiveRecord::Migration
  def self.up
    create_table :routes do |t|
      t.string :color_one
      t.string :color_two
      t.string :color_three
      t.string :difficulty_display
      t.integer :difficulty_position
      t.boolean :is_live
      t.integer :wall_id

      t.timestamps
    end
  end

  def self.down
    drop_table :routes
  end
end
