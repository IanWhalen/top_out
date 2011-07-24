class CreateCompletedRoutes < ActiveRecord::Migration
  def self.up
    create_table :completed_routes do |t|
      t.integer :problem_id
      t.integer :user_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :completed_routes
  end
end
