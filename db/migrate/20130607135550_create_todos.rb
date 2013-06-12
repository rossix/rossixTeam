class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :todotitle
      t.string :description
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
