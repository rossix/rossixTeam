class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :email
      t.string :crypted_password
      t.string :salt
      t.string :remember_token
      t.datetime :remember_token_expires_at
      t.string :name
      t.string :firstname
      t.integer :group_id
      t.string :telnr

      t.timestamps
    end
  end
end
