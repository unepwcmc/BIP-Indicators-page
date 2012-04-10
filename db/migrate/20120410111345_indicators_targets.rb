class IndicatorsTargets < ActiveRecord::Migration
  def change
    create_table :indicators_targets, :id => false do |t|
      t.integer :target_id
      t.integer :indicator_id
    end
  end
end
