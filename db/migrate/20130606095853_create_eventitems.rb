class CreateEventitems < ActiveRecord::Migration
  def change
    create_table :eventitems do |t|
      t.string :item
      t.string :description

      t.timestamps
    end
  end
end
