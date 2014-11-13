class AddIndexToProductName < ActiveRecord::Migration
  def change
    add_index :posts, :product_name, unique: true
  end
end
