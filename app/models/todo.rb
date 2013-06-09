class Todo < ActiveRecord::Base
  attr_accessible :description, :project_id, :todo, :user_id
end
