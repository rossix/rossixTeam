class AddProjecteventidTodos < ActiveRecord::Migration
  def change
    add_column :todos, :projectevent_id, :integer
  end
end