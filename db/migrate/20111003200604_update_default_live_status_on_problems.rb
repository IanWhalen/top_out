class UpdateDefaultLiveStatusOnProblems < ActiveRecord::Migration
  def self.up
    change_column :problems, :is_live, :boolean, :default => 'true'
  end

  def self.down
    # You can't currently remove default values in Rails
    raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end
end
