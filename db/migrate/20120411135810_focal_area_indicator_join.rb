class FocalAreaIndicatorJoin < ActiveRecord::Migration
  def change
    create_table 'focal_areas_indicators', :id => false do |t|
      t.integer :focal_area_id
      t.integer :indicator_id
    end
  end
end
