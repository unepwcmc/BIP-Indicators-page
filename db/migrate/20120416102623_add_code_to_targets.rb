class AddCodeToTargets < ActiveRecord::Migration
  def change
    add_column :targets, :code, :integer
  end
end
