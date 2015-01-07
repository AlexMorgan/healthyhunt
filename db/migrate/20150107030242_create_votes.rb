class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :voteable_id, null: false
      t.string :voteable_type, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :votes, [:user_id, :voteable_id, :voteable_type], unique: true
  end
end
