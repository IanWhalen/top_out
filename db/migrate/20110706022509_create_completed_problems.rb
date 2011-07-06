class CreateCompletedProblems < ActiveRecord::Migration
  def self.up
    create_table :completed_problems do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :completed_problems
  end
end
