class Project < ActiveRecord::Base
  belongs_to :user
  has_many :projectevents
  has_many :todos
  attr_accessible :all_day, :className, :color, :description, :ends_at, :starts_at, :title, :projectlink, :user_id
end
