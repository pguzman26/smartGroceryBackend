class AddUserRefToGroceries < ActiveRecord::Migration
  def change
    add_reference :groceries, :user, index: true, foreign_key: true
  end
end
