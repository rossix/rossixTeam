class Todo < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  attr_accessible :description, :project_id, :todotitle, :user_id,:state, :position
end
