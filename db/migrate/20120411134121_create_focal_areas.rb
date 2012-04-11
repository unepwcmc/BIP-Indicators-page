class CreateFocalAreas < ActiveRecord::Migration
  def change
    create_table :focal_areas do |t|
      t.string :name

      t.timestamps
    end
  end
end
