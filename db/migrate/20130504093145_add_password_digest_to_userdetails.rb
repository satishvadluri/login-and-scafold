class AddPasswordDigestToUserdetails < ActiveRecord::Migration
  def change
    add_column :userdetails, :password_digest, :string
  end
end
