class Todo < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  belongs_to :project
  belongs_to :projectevent
  attr_accessible :description, :project_id, :todotitle, :user_id,:state, :position, :projectevent_id
end
