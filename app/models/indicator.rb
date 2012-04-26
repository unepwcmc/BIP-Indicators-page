class Indicator < ActiveRecord::Base
  has_and_belongs_to_many :targets
  has_and_belongs_to_many :headlines
  has_and_belongs_to_many :focal_areas
  has_and_belongs_to_many :partners

  def link
    "http://www.bipindicators.net/#{rel_link}"
  end
end
