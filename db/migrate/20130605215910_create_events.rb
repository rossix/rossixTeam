class CreateEvents < ActiveRecord::Migration
  def change

       create_table :events do |t|
         t.string :title
         t.datetime :starts_at
         t.datetime :ends_at
         t.boolean :all_day
         t.text :description
         t.string :className
         t.string :color
         t.timestamps
       end


  end
end
