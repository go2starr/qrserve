class AddCartIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :cart_id, :integer
    add_column :carts,  :user_id, :integer
  end

  def self.down
    remove_column :users, :cart_id
    remove_column :carts, :user_id    
  end
end
