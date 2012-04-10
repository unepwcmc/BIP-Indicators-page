class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.integer :goal_id
      t.integer :index
      t.string :keyword
      t.string :title

      t.timestamps
    end
  end
end
