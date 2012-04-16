class AddCodeToHeadlines < ActiveRecord::Migration
  def change
    add_column :headlines, :code, :integer
  end
end
