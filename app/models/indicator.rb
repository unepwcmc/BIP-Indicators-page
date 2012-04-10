class Indicator < ActiveRecord::Base
  has_and_belongs_to_many :targets
  belongs_to :headline
  belongs_to :partner
end
