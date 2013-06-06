class Eventitem < ActiveRecord::Base
  has_many :events
  attr_accessible :description, :item, :color
end
