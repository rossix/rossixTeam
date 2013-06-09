class Project < ActiveRecord::Base
  belongs_to :user
  has_many :projectevents
  attr_accessible :all_day, :className, :color, :description, :ends_at, :starts_at, :title
end
