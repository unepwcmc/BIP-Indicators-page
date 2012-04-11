class AddRelLinkToIndicators < ActiveRecord::Migration
  def change
    add_column :indicators, :rel_link, :string
  end
end
