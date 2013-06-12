class AddProjectlinkProjects < ActiveRecord::Migration
  def change
    add_column :projects, :projectlink, :string
  end
end
