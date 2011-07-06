class CreateClimbingSessions < ActiveRecord::Migration
  def self.up
    create_table :climbing_sessions do |t|
      t.datetime :start
      t.datetime :finish

      t.timestamps
    end
  end

  def self.down
    drop_table :climbing_sessions
  end
end
