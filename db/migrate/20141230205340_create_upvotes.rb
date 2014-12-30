class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.integer :user_id, null: false
      t.integer :post_id, null: false

      t.timestamps
    end

      add_index :upvotes, [:post_id, :user_id], unique: true
  end
end
