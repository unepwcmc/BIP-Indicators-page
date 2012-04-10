class Target < ActiveRecord::Base
  belongs_to :goal
  has_and_belongs_to_many :indicators
end
