class Upvote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :post_id, presence: true
  validates :user_id, presence: true
  validates :post_id, uniqueness: {scope: :user_id, message: "You have already liked this post"}
end
