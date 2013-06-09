class AddProjectidProjectevents < ActiveRecord::Migration
  def change
    add_column :projectevents, :project_id, :integer
  end
end
