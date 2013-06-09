class AddTypeProjectevents < ActiveRecord::Migration
  def change
    add_column :projectevents, :eventtype, :string
  end
end
