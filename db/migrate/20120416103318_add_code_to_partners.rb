class AddCodeToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :code, :integer
  end
end
