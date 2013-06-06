class AddColorEventitems < ActiveRecord::Migration
  def change
    add_column :eventitems, :color, :string

  end
end