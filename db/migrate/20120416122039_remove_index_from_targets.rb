class RemoveIndexFromTargets < ActiveRecord::Migration
  def change
    remove_column :targets, :index
  end
end
