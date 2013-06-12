class AddStateProjects < ActiveRecord::Migration
  def change
    add_column :projects, :state, :string
    add_column :projectevents, :state, :string
    add_column :todos, :state, :string
    add_column :todos, :position, :integer
  end
end
