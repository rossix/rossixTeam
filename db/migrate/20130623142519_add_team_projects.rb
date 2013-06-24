class AddTeamProjects < ActiveRecord::Migration
  def up
    add_column :projects, :team_id, :integer
    add_column :projectevents, :team_id, :integer
    add_column :events, :team_id, :integer
    add_column :eventitems, :team_id, :integer
    add_column :todos, :team_id, :integer
    add_column :users, :team_id, :integer
  end

  def down
  end
end
