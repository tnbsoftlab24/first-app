class AddUserToShops < ActiveRecord::Migration[5.1]
  def change
    add_reference :shops, :user, foreign_key: true
  end
end
