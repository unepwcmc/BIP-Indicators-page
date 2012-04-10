class CreateIndicatorsPartners < ActiveRecord::Migration
  def change
    create_table :indicators_partners, :id => false do |t|
      t.integer :partner_id
      t.integer :indicator_id
    end
  end
end
