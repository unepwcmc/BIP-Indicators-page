class CreateHeadlinesIndicators < ActiveRecord::Migration
  def change
    create_table :headlines_indicators, :id => false do |t|
      t.integer :headline_id
      t.integer :indicator_id
    end
  end
end
