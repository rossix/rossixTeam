class AddUserEventEvents < ActiveRecord::Migration
  def change
    add_column :events, :eventitem_id, :integer
    add_column :events, :user_id, :integer

  end
end