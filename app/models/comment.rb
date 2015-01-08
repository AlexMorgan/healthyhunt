class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :votes,
  as: :voteable,
  dependent: :destroy

  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :body, presence: true

  def belongs(user)
    self.user == user
  end

  def upvote_from(user)
    votes.find_by(user_id: user.id)
  end

  # Create method to find whether or not signed in user has liked a post
  def has_upvote_from(user)
    votes.find_by(user_id: user.id).present?
  end
end
