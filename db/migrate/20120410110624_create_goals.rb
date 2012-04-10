class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :code
      t.string :title

      t.timestamps
    end
  end
end
