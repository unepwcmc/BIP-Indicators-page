class AddCodeAndQuestionToFocalAreas < ActiveRecord::Migration
  def change
    add_column :focal_areas, :code, :integer
    add_column :focal_areas, :question, :string
  end
end
