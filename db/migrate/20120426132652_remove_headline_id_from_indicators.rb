class RemoveHeadlineIdFromIndicators < ActiveRecord::Migration
  def change
    remove_column :indicators, :headline_id
  end
end
