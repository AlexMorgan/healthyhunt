class Post < ActiveRecord::Base
  belongs_to :user
  has_many :upvotes,
    dependent: :destroy
  has_many :comments,
    dependent: :destroy
  has_many :votes,
    as: :voteable,
    dependent: :destroy


  validates :product_name, presence: true, uniqueness: true
  validates_formatting_of :url, using: :url, allow_blank: false
  validates :tagline, presence: true, length: { in: 10..80}

  # creates a method that returns the upvote of the specific post that belongs to the current user
  def upvote_from(user)
    upvotes.find_by(user_id: user.id)
  end

  # Create method to find whether or not signed in user has liked a post
  def has_upvote_from(user)
    upvotes.find_by(user_id: user.id).present?
  end
end
