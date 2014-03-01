class AddProjectlinkTodos < ActiveRecord::Migration
  def change
    add_column :todos, :projectlink, :string
  end
end
