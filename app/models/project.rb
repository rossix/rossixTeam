                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          class Project < ActiveRecord::Base
  belongs_to :user
  has_many :projectevents
  has_many :todos
  attr_accessible :all_day, :className, :color, :description, :ends_at, :starts_at, :title, :projectlink, :user_id, :state


  scope :between, lambda {|start_time, end_time|
    {:conditions => ["? < starts_at < ?", Project.format_date(start_time), Project.format_date(end_time)] }
  }

end
