class RemoveUpvotesFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :upvote_count, :integer
  end
end
