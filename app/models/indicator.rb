class Indicator < ActiveRecord::Base
  has_and_belongs_to_many :targets
  belongs_to :headline
  has_and_belongs_to_many :partners
end
