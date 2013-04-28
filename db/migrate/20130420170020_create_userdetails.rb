class CreateUserdetails < ActiveRecord::Migration
  def change
    create_table :userdetails do |t|
      t.string :firstname
      t.string :lastname
      t.string :userid
      t.string :password
      t.boolean :enabled

      t.timestamps
    end
  end
end
