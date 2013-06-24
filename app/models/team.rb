class Team < ActiveRecord::Base
  has_many :users
  has_many :projects
  has_many :projectevents

  attr_accessible :teamname, :description

end
