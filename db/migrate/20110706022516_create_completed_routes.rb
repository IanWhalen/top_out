class CreateCompletedRoutes < ActiveRecord::Migration
  def self.up
    create_table :completed_routes do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :completed_routes
  end
end
