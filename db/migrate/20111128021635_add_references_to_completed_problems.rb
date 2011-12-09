class AddReferencesToCompletedProblems < ActiveRecord::Migration
  def self.up
    change_table :completed_problems do |t|
      t.integer :climbing_session_id
    end
    
    change_table :climbing_sessions do |t|
      t.integer :user_id
    end

  end

  def self.down
    remove_column :completed_problems, :climbing_session_id
    remove_column :climbing_sessions, :user_id
  end
end
