class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :product_name, null: false
      t.text :url, null: false
      t.text :tagline, null: false
      t.integer :upvote_count, default: 0

      t.timestamps
    end
  end
end
