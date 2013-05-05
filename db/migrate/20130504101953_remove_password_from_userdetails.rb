class RemovePasswordFromUserdetails < ActiveRecord::Migration
  def up
    remove_column :userdetails, :password
  end

  def down
    add_column :userdetails, :password, :string
  end
end
