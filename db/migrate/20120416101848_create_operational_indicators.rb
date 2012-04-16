class CreateOperationalIndicators < ActiveRecord::Migration
  def change
    create_table :operational_indicators do |t|
      t.integer :code
      t.string :title

      t.timestamps
    end
  end
end
