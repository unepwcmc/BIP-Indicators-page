class FocalArea < ActiveRecord::Base
  has_and_belongs_to_many :indicators
end