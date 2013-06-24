class AddDescriptionTeams < ActiveRecord::Migration
  def up
    add_column :teams, :description, :text
  end

  def down
  end
end
