class CreateIndicators < ActiveRecord::Migration
  def change
    create_table :indicators do |t|
      t.integer :headline_id
      t.integer :partner_id
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
