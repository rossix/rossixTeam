class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :todo
      t.string :description
      t.intger :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
